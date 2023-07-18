/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   pushswap.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: shechong <shechong@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/06/23 12:17:45 by shechong          #+#    #+#             */
/*   Updated: 2023/07/18 12:25:22 by shechong         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "push_swap.h"
#include <stdio.h>

// the following is incorrectly sorted: 100 5 2 4 3

int	main(int ac, char **av)
{
	t_stack	*stack_a;
	t_stack	*stack_b;

	if (ac == 1)
		return (0);
	if (checks(ac, av) == 2)
		exit (0);
	if (checks(ac, av) == 1)
	{
		write(2, "Error\n", 6);
		exit (1);
	}
	stack_b = NULL;
	if (ac == 2)
		stack_a = string_to_stack(av[1]);
	else
		stack_a = arg_to_stack(ac, av);
	assign_index(stack_a, list_size(stack_a));
	if (stack_a && !check_sorted(stack_a))
		sort(&stack_a, &stack_b, list_size(stack_a));
	ft_free_stack((t_list **)(&stack_a));
	ft_free_stack((t_list **)(&stack_b));
}

void	sort(t_stack **a, t_stack **b, int list_size)
{
	int	i;

	if (list_size == 1)
		exit(0);
	else if (list_size == 2)
		swap_top(a, b, "sa");
	else if (list_size == 3)
		sort3(a, b);
	else if (list_size == 5)
		sort5(a, b);
	else if (list_size == 4)
		sort4(a, b, list_size);
	else if (list_size < 40)
	{
		i = -1;
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
