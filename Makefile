CC = gcc
CFLAGS = -Wall -Wextra -Werror
LDFLAGS =

PUSHSWAP = node_utils.c commands.c parsing.c sorting.c pushswap.c 
OBJS = $(PUSHSWAP:.c=.o)
EXEC = push_swap

CHECKER_SRC = node_utils.c commands.c parsing.c sorting.c checker_bonus.c
CHECKER_OBJS = $(CHECKER_SRC:.c=.o)
CHECKER_EXEC = checker

all: $(EXEC)

%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

libft/libft.a:
	$(MAKE) -C libft

bonus: $(CHECKER_EXEC)

$(EXEC): $(OBJS) libft/libft.a
	$(CC) $(OBJS) -Llibft -lft -o $(EXEC)

$(CHECKER_EXEC): $(CHECKER_OBJS) libft/libft.a
	$(CC) $(CHECKER_OBJS) -Llibft -lft -o $(CHECKER_EXEC)

clean:
	rm -f $(OBJS) $(CHECKER_OBJS)
	$(MAKE) -C libft clean

fclean: clean
	rm -f $(EXEC) $(CHECKER_EXEC)
	$(MAKE) -C libft fclean

re: fclean all

.PHONY: all clean fclean re