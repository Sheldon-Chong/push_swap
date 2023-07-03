/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   push_swap.h                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: shechong <shechong@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/06/19 19:08:22 by shechong          #+#    #+#             */
/*   Updated: 2023/07/03 18:02:04 by shechong         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef PUSH_SWAP_H
# define PUSH_SWAP_H
# include "./libft/libft.h"
# include <limits.h>

typedef struct s_stack
{
	int				num;
	int				index;
	struct s_stack	*next;
}	t_stack;

// commands.c
void	swap_top(t_stack **a, t_stack **b, char *str);
void	push(t_stack **a, t_stack **b, char *str);
void	rot(t_stack **a, t_stack **b, char *str);
void	rot_rev(t_stack **a, t_stack **b, char *str);
int		rotate_until(t_stack **stack, t_stack **stack_b, int index);

//debug.c
void	print_list(t_stack **lst, char *title);
size_t	printlist_double(t_stack **lst, t_stack **lst2);

//node utils
void	add_node_back(t_stack **lst, t_stack *new_node);
int		list_size(t_stack *lst);
t_stack	*last_node(t_stack **lst);
t_stack	*new_node(int num);
int		check_sorted(t_stack *head);

//parsing
t_stack	*arg_to_stack(int ac, char **av);
int		assignindex(t_stack **stack);
t_stack	*findsmall(t_stack **stack, int minimum);
t_stack	*string_to_stack(char *str);
int		checks(int ac, char **av);

// sorts
t_stack	**sort3(t_stack **a, t_stack **b);
void	sort(t_stack **a, t_stack **b, int list_size);

#endif
