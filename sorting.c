/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   sorting.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: shechong <shechong@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/07/03 11:07:05 by shechong          #+#    #+#             */
/*   Updated: 2023/07/18 12:40:29 by shechong         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "push_swap.h"

void	radix2(t_stack **a, t_stack **b, int *bit_index)
{
	int	size;

	size = list_size(*a);
	while (size > 0 && !check_sorted(*a))
	{
		if ((((*a)->index >> *bit_index) & 1) == 1)
			rot(a, b, "ra");
		else
			push(a, b, "pb");
		size --;
	}
	(*bit_index)++;
	size = list_size(*b);
	while (size > 0 && !check_sorted(*b))
	{
		if ((((*b)->index >> *bit_index) & 1) == 0)
			rot(a, b, "rb");
		else
			push(a, b, "pa");
		size --;
	}
}

t_stack	**radix1(t_stack **a, t_stack **b)
{
	int	bit_index;
	int	bit_size;
	int	size;

	bit_size = 0;
	bit_index = 0;
	size = list_size(*a);
	while (size > 1 && ++bit_size)
		size /= 2;
	while (bit_index <= bit_size)
		radix2(a, b, &bit_index);
	while (*b)
		push(a, b, "pa");
	return (a);
}

t_stack	**sort3(t_stack **a, t_stack **b)
{
	t_stack	*n3;

	n3 = (*a)->next->next;
	if ((*a)->index == 2 && (*a)->next->index == 1 && n3->index == 0)
	{
		swap_top(a, b, "sa");
		rot_rev(a, b, "rra");
	}
	if ((*a)->index == 1 && (*a)->next->index == 0 && n3->index == 2)
		swap_top(a, b, "sa");
	if ((*a)->index == 2 && (*a)->next->index == 0 && n3->index == 1)
		rot(a, b, "ra");
	if ((*a)->index == 0 && (*a)->next->index == 2 && n3->index == 1)
	{
		swap_top(a, b, "sa");
		rot(a, b, "ra");
	}
	if ((*a)->index == 1 && (*a)->next->index == 2 && n3->index == 0)
		rot_rev(a, b, "rra");
	return (a);
}

void	sort4(t_stack **a, t_stack **b, int lst_size)
{
	if (lst_size == 4)
	{
		rotate_until(a, b, 3);
		push(a, b, "pb");
		sort3(a, b);
		push(b, a, "pa");
		rot(a, b, "ra");
	}
}

void	sort5(t_stack **a, t_stack **b)
{
	if ((*a)->next->next->index == 4 && (*a)->index == 3)
	{
		push(a, b, "pb");
		rot(a, b, "ra");
		push(a, b, "pb");
	}
	else
	{
		rotate_until(a, b, 4);
		push(a, b, "pb");
		rotate_until(a, b, 3);
		push(a, b, "pb");
	}
	sort3(a, b);
	if ((*b)->index == 4)
		swap_top(a, b, "sb");
	push(a, b, "pa");
	rot(a, b, "ra");
	push(a, b, "pa");
	rot(a, b, "rra");
	rot(a, b, "ra");
}
