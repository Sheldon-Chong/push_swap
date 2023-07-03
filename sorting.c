/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   sorting.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: shechong <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/07/03 11:07:05 by shechong          #+#    #+#             */
/*   Updated: 2023/07/03 11:07:06 by shechong         ###   ########.fr       */
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

	if (list_size(*a) == 2 && ((*a)->index > (*a)->next->index))
	{
		rot(a, b, "ra");
		return (a);
	}
	n3 = (*a)->next->next;
	if ((*a)->index == 3 && (*a)->next->index == 2 && n3->index == 1)
	{
		swap_top(a, b, "sa");
		rot_rev(a, b, "rra");
	}
	if ((*a)->index == 2 && (*a)->next->index == 1 && n3->index == 3)
		swap_top(a, b, "sa");
	if ((*a)->index == 3 && (*a)->next->index == 1 && n3->index == 2)
		rot(a, b, "ra");
	if ((*a)->index == 1 && (*a)->next->index == 3 && n3->index == 2)
	{
		swap_top(a, b, "sa");
		rot(a, b, "ra");
	}
	if ((*a)->index == 2 && (*a)->next->index == 3 && n3->index == 1)
		rot_rev(a, b, "rra");
	return (a);
}

void	sort5(t_stack **a, t_stack **b, int list_size)
{
	if (list_size == 4)
	{
		rotate_until(a, b, 4);
		push(a, b, "pb");
		sort3(a, b);
		push(b, a, "pa");
		rot(a, b, "ra");
	}
	if (list_size == 5)
	{
		rotate_until(a, b, 5);
		push(a, b, "pb");
		rotate_until(a, b, 4);
		push(a, b, "pb");
		sort3(a, b);
		push(a, b, "pa");
		rot(a, b, "ra");
		push(a, b, "pa");
		rot(a, b, "ra");
	}
}

void	sort(t_stack **a, t_stack **b, int list_size)
{
	int	i;

	if (list_size == 1)
		exit(0);
	if (list_size <= 3)
		sort3(a, b);
	else if (list_size <= 5)
		sort5(a, b, list_size);
	else if (list_size < 40)
	{
		i = 0;
		while (++i < list_size)
		{
			rotate_until(a, b, i);
			push(a, b, "pb");
		}
		while (*b)
			push(a, b, "pa");
	}
	else
		radix1(a, b);
}
