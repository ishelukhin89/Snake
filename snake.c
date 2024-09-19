#include <stdio.h>
#include <stdlib.h>
#include <ncurses.h>

enum { LEFT, UP, RIGHT, DOWN, STOP_GAME=KEY_F(10), CONTROLS=3 };

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

int checkDirection(snake_t *head);

void initTail(tail_t tail[], size_t size){
    tail_t init_tail = {0,100};
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

void go(snake_t *head){
    char ch = '@';
    mvprintw(head->y, head->x, " ");
    switch (head->direction)
    {
        case LEFT:
            mvprintw(head->y, --(head->x), "%c", ch);               
            printf("%d", checkDirection(head));
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

int checkDirection(snake_t *head){//сравнить каждую пару координат хвоста с четырьмя из возможных пар
    for(size_t i = head->tsize - 1; i > 0; i--){ 
        if(head->y == head->tail[i-1].y && head->x == head->tail[i-1].x)
            return 1;
        else if(head->y == head->tail[i-1].y && head->x == head->tail[i-1].x)
            return 1;
        else if(head->y == head->tail[i-1].y && head->x == head->tail[i-1].x)
            return 1;
        else if(head->y == head->tail[i-1].y && head->x == head->tail[i-1].x)
            return 1;
    }
    return 0;
}

int main(){
    snake_t* snake = (snake_t*) malloc(sizeof(snake_t));
    initSnake(snake, START_TAIL_SIZE, 10, 10);
    initscr();
    keypad(stdscr, TRUE);
    raw();
    noecho();
    curs_set(FALSE);
    mvprintw(0, 0,"Use arrows for control. Press'F10' for EXIT");
    timeout(0); 
    int key_pressed = 0;
    while( key_pressed != STOP_GAME ) {
        key_pressed = getch(); 
        go(snake);
        goTail(snake);
        timeout(500);
        changeDirection(snake, key_pressed);
    }
    free(snake->tail);
    free(snake);
    endwin();
    return 0;
}