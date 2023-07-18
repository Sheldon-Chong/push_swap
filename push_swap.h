/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   push_swap.h                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: shechong <shechong@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/06/19 19:08:22 by shechong          #+#    #+#             */
/*   Updated: 2023/07/07 20:06:23 by shechong         ###   ########.fr       */
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

//node utils
void	add_node_back(t_stack **lst, t_stack *new_node);
int		list_size(t_stack *lst);
t_stack	*last_node(t_stack **lst);
t_stack	*new_node(int num);
int		check_sorted(t_stack *head);

//parsing
t_stack	*arg_to_stack(int ac, char **av);
t_stack	*findsmall(t_stack **stack, int minimum);
t_stack	*string_to_stack(char *str);
int		checks(int ac, char **av);

// sorts
void	assign_index(t_stack *stack_a, int stack_size);
t_stack	**sort3(t_stack **a, t_stack **b);
void	sort4(t_stack **a, t_stack **b, int lst_size);

void	sort(t_stack **a, t_stack **b, int list_size);
void	sort5(t_stack **a, t_stack **b);
t_stack	**radix1(t_stack **a, t_stack **b);
void	radix2(t_stack **a, t_stack **b, int *bit_index);

#endif
