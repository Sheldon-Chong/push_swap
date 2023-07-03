/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   commands.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: shechong <shechong@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/07/03 11:06:52 by shechong          #+#    #+#             */
/*   Updated: 2023/07/03 11:08:46 by shechong         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "push_swap.h"

void	swap_top(t_stack **a, t_stack **b, char *str)
{
	int		temp;
	t_stack	*item1;
	t_stack	*item2;

	if (list_size(*a) < 2)
		return ;
	if (ft_strncmp(str, "sb", 2) == 0)
		a = b;
	if (*a && (*a)->next)
	{
		item1 = *a;
		item2 = (*a)->next;
		temp = item2->num;
		item2->num = item1->num;
		item1->num = temp;
	}
	if (ft_strncmp(str, "ss", 2) == 0)
		swap_top(b, a, "recur");
	if (ft_strncmp(str, "recur", 5) == 0)
		return ;
	if (ft_instr('#', str))
		return ;
	ft_putstr_fd(str, 1);
	ft_putstr_fd("\n", 1);
}

void	push(t_stack **a, t_stack **b, char *str)
{
	t_stack	*temp;

	if (!ft_instr('#', str))
	{
		ft_putstr_fd(str, 1);
		ft_putstr_fd("\n", 1);
	}
	if (ft_strncmp(str, "pa", 2) == 0)
	{
		temp = *b;
		if (!*b)
			return ;
		*b = (*b)->next;
		temp->next = *a;
		*a = temp;
	}
	if (ft_strncmp(str, "pb", 2) == 0)
	{
		temp = *a;
		if (!*a)
			return ;
		*a = (*a)->next;
		temp->next = *b;
		*b = temp;
	}
}

void	rot(t_stack **a, t_stack **b, char *str)
{
	t_stack	*first;

	if (ft_strncmp(str, "rb", 2) == 0)
		a = b;
	if (!(*a && (*a)->next))
		return ;
	first = *a;
	last_node(a)->next = first;
	*a = first->next;
	first->next = NULL;
	if (ft_strncmp(str, "rr", 2) == 0)
	{
		if (!(*b && (*b)->next))
			return ;
		first = *b;
		last_node(b)->next = first;
		*b = first->next;
		first->next = NULL;
	}
	if (ft_instr('#', str))
		return ;
	ft_putstr_fd(str, 1);
	ft_putstr_fd("\n", 1);
}

void	rot_rev(t_stack **a, t_stack **b, char *str)
{
	t_stack	*current;
	t_stack	*last;

	if (ft_strncmp(str, "rrb", 3) == 0)
		a = b;
	last = last_node(a);
	if (!(*a && (*a)->next))
		return ;
	current = *a;
	while (current->next->next != NULL)
		current = current->next;
	last->next = *a;
	*a = last;
	current->next = NULL;
	if (ft_strncmp(str, "recur", 5) == 0)
		return ;
	if (ft_strncmp(str, "rrr", 3) == 0)
		rot_rev(b, a, "recur");
	if (ft_instr('#', str))
		return ;
	ft_putstr_fd(str, 1);
	ft_putstr_fd("\n", 1);
}

int	rotate_until(t_stack **stack, t_stack **stack_b, int index)
{
	int		amount;
	t_stack	*current;

	amount = 0;
	current = *stack;
	while (current)
	{
		if (current->index == index)
			break ;
		current = current->next;
		amount ++;
	}
	if (!current || current->index != index)
		return (0);
	if (amount < (list_size(*stack)) / 2)
	{
		while ((*stack)->index != index)
			rot(stack, stack_b, "ra");
		return (1);
	}
	while ((*stack)->index != index)
		rot_rev(stack, stack_b, "rra");
	return (1);
}
