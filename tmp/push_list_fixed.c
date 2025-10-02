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

    assert(n != NULL);
    n->element = e;
    n->next = head;

    return n;
}

void FreeList(struct node *head) {
    struct node *current = head;
    while (current != NULL) {
        struct node *next = current->next;
        free(current);
        current = next;
    }
}

int main(int argc, char **argv) {
    struct node *list = NULL;

    list = Push(list, 1);
    list = Push(list, 2);

    // Proper cleanup - this fixes the leak!
    FreeList(list);

    return 0;
}