#include <stdio.h>
#include <stdlib.h>
#include <ncurses.h>
#include <time.h>

enum { LEFT, UP, RIGHT, DOWN, STOP_GAME=KEY_F(10), CONTROLS=3, PAUSE_GAME=112 };

enum { MAX_TAIL_SIZE=100, START_TAIL_SIZE=3, MAX_FOOD_SIZE=20, FOOD_EXPIRE_SECONDS=10 };

struct control_buttons{
    int down;
    int up;
    int left;
    int right;
}control_buttons;

struct control_buttons default_controls[CONTROLS] = {{KEY_DOWN, KEY_UP, KEY_LEFT, KEY_RIGHT},
                                                    {'s', 'w', 'a', 'd'},
                                                    {'S', 'W', 'A', 'D'}};

typedef struct tail_t{
	int x;
	int y;
}tail_t;
	
typedef struct snake_t{
	int x;
	int y;
    size_t tsize;
    int direction;		
    struct tail_t* tail;
    struct control_buttons* controls;
}snake_t;

struct food{
    int x;
    int y;
    time_t put_time;
    char point;
    uint8_t enable;
} food[MAX_FOOD_SIZE];

_Bool isTail(snake_t *head);

void initFood(struct food f[], size_t size){
    struct food init = {0,0,0,0,0};
    int max_y = 0, max_x = 0;
    getmaxyx(stdscr, max_y, max_x);
    for(size_t i = 0; i < size; i++){
        f[i] = init;
    }
}

void initTail(tail_t tail[], size_t size){
    tail_t init_tail = {0,0};
    for(size_t i = 0; i < size; i++){
        tail[i] = init_tail;
    }
}

void initHead(snake_t *head, int x, int y){
    head->x = x;
    head->y = y;
    head->direction = RIGHT;
}

void initSnake(snake_t *head, size_t size, int x, int y){
    tail_t* tail = (tail_t*) malloc(MAX_TAIL_SIZE *sizeof(tail_t));
    initTail(tail, MAX_TAIL_SIZE);
    initHead(head, x, y);
    head->tail = tail;
    head->tsize = size + 1;
    head->controls = default_controls;
}

void putFoodSeed(struct food *fp){
    int max_x = 0, max_y = 0;
    char spoint[2] = {0};
    getmaxyx(stdscr, max_y, max_x);
    mvprintw(fp->y, fp->x, " ");
    fp->x = rand() % (max_x - 1);
    fp->y = rand() % (max_y - 2) + 1;
    fp->put_time = time(NULL);
    fp->point = '$';
    fp->enable = 1;
    spoint[0] = fp->point;
    mvprintw(fp->y, fp->x, "%s", spoint);
}

void putFood(struct food f[], size_t number_seeds){
    for(size_t i = 0; i < number_seeds; i++){
        putFoodSeed(&f[i]);
    }
}

void refreshFood(struct food f[], int nfood){
    int max_x = 0, max_y = 0;
    char spoint[2] = {0};
    getmaxyx(stdscr, max_y, max_x);
    for(size_t i = 0; i < nfood; i++){
        if( f[i].put_time ){
            if( !f[i].enable || (time(NULL) - f[i].put_time) > FOOD_EXPIRE_SECONDS )
                putFoodSeed(&f[i]);
        }
    }
}

_Bool haveEat(struct snake_t *head, struct food f[]){
    for(size_t i = 0; i < MAX_FOOD_SIZE; i++){
        if( f[i].enable && head->x == f[i].x && head->y == f[i].y ){
            f[i].enable = 0;
            return 1;
        }
    }
    return 0;
}

void addTail(struct snake_t *head){
    if(head == NULL || head->tsize > MAX_TAIL_SIZE){
        mvprintw(0, 0, "Can't add tail");
        return;
    }
    head->tsize++;
}

void go(snake_t *head){
    char ch = '@';
    mvprintw(head->y, head->x, " ");
    switch (head->direction)
    {
        case LEFT:
            mvprintw(head->y, --(head->x), "%c", ch);               
            break;
        case RIGHT:
            mvprintw(head->y, ++(head->x), "%c", ch);
            break;
        case UP:
            mvprintw(--(head->y), head->x, "%c", ch);            
            break;
        case DOWN:
            mvprintw(++(head->y), head->x, "%c", ch);
            break; 
        default:
        break;
    } 
    refresh();
}

void goTail(snake_t *head){
    char ch = '*';
    mvprintw(head->tail[head->tsize-1].y, head->tail[head->tsize-1].x, " ");

    for(size_t i = head->tsize - 1; i > 0; i--){
        head->tail[i] = head->tail[i-1];
        if(head->tail[i].y || head->tail[i].x)
            mvprintw(head->tail[i].y, head->tail[i].x, "%c", ch);
    }
    head->tail[0].x = head->x;
    head->tail[0].y = head->y;
}

void goSnake(snake_t *head){
    go(head);
    if(!isTail(head))
        goTail(head);
}

void changeDirection(snake_t* snake, const int32_t key){
    for(int i = 0; i < CONTROLS; i++){
        if (key == snake->controls[i].down)
            snake->direction = DOWN;
        else if (key == snake->controls[i].up)
                snake->direction = UP;
        else if (key == snake->controls[i].right)
                snake->direction = RIGHT;
        else if (key == snake->controls[i].left)
                snake->direction = LEFT;
    }
}

_Bool isTail(snake_t *head){
    for(size_t i = head->tsize-1; i > 0; i--){ 
        if(head->y == head->tail[i].y && head->x == head->tail[i].x)
            return 1;
    }
    return 0;
}

void printLevel(snake_t *head){
    int max_x = 0, max_y = 0;
    getmaxyx(stdscr, max_x, max_y);
    mvprintw(5, max_x-10, "LEVEL: %d", head->tsize);
}

void printExit(snake_t *head){
    int max_x = 0, max_y = 0;
    getmaxyx(stdscr, max_x, max_y);
    mvprintw(max_y/2, max_x/2 - 5, "Total level: %d", head->tsize);
    refresh();
    getchar();
}

void pause(){
    int max_x = 0, max_y = 0;
    getmaxyx(stdscr, max_x, max_y);
    mvprintw(max_y/2, max_x/2 - 5, "Press P to continue");
    while (getch() != PAUSE_GAME)
    {}
    mvprintw(max_y/2, max_x/2 - 5, "                   ");   
}

int main(){
    snake_t* snake = (snake_t*) malloc(sizeof(snake_t));
    initSnake(snake, START_TAIL_SIZE, 10, 10);
    initscr();
    putFood(food, 10);
    keypad(stdscr, TRUE);
    raw();
    noecho();
    curs_set(FALSE);
    mvprintw(0, 0,"Use arrows for control. Press'F10' for EXIT");
    
    double DELAY = 0.1;
    int key_pressed = 0;
    timeout(0);
    while( key_pressed != STOP_GAME ) {
        clock_t begin = clock();
        key_pressed = getch(); 
        goSnake(snake);
        changeDirection(snake, key_pressed);

        if(key_pressed == PAUSE_GAME) pause();

        refreshFood(food, 3);

        if(haveEat(snake, food)){
            addTail(snake);
            printLevel(snake);
            DELAY -= 0.009;
        }

        while (((double)clock() - begin) / CLOCKS_PER_SEC < DELAY)
        {
       
        }
        refresh();
    }
    free(snake->tail);
    free(snake);
    endwin();
    return 0;
}