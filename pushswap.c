/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   pushswap.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: shechong <shechong@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/06/23 12:17:45 by shechong          #+#    #+#             */
/*   Updated: 2023/07/03 11:08:59 by shechong         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "push_swap.h"

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
	assignindex(&stack_a);
	if (stack_a && !check_sorted(stack_a))
		sort(&stack_a, &stack_b, list_size(stack_a));
	ft_free_stack((t_list **)(&stack_a));
	ft_free_stack((t_list **)(&stack_b));
}
