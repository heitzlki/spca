#include <stdio.h>
#include <stdlib.h>
#include <assert.h>

struct node {
    int element;
    struct node *next;
};

struct node *Push(struct node *head, int e) {
    struct node *n =
    (struct node *)malloc(sizeof(struct node));

    assert(n != NULL); // crashes if false
    n->element = e;
    n->next = head;

    return n;
}

int main(int argc, char **argv) {
    struct node *list = NULL;

    list = Push(list, 1);
    list = Push(list, 2);

    return 0;
}