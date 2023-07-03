/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   checker.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: shechong <shechong@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/06/19 19:04:58 by shechong          #+#    #+#             */
/*   Updated: 2023/06/23 20:06:10 by shechong         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "push_swap.h"

int	command(t_stack **a, t_stack **b, char *line)
{
	if (!ft_strncmp(line, "sa", 2))
		swap_top(a, b, "sa#");
	else if (!ft_strncmp(line, "sb", 2))
		swap_top(a, b, "sb#");
	else if (!ft_strncmp(line, "ra", 2))
		rot(a, b, "ra#");
	else if (!ft_strncmp(line, "rb", 2))
		rot(a, b, "rb#");
	else if (!ft_strncmp(line, "rra", 3))
		rot_rev(a, b, "rra#");
	else if (!ft_strncmp(line, "rrb", 3))
		rot_rev(a, b, "rrb#");
	else if (!ft_strncmp(line, "ss", 2))
		swap_top(a, b, "ss#");
	else if (!ft_strncmp(line, "rr", 2))
		rot(a, b, "rr#");
	else if (!ft_strncmp(line, "rrr", 3))
		rot_rev(a, b, "rrr#");
	else if (!ft_strncmp(line, "pa", 2))
		push(a, b, "pa#");
	else if (!ft_strncmp(line, "pb", 2))
		push(a, b, "pb#");
	else
		return (0);
	return (1);
}

int	read_lines(t_stack **stack_a, t_stack **stack_b)
{
	char	*line;

	line = get_next_line(0);
	while (ft_strlen(line) > 1)
	{
		if (command(stack_a, stack_b, line) == 0)
		{
			free(line);
			ft_putstr_fd("Error\n", 2);
			return (0);
		}
		free(line);
		line = get_next_line(0);
	}
	free(line);
	return (0);
}

int	main(int argc, char **argv)
{
	t_stack	*stack_a;
	t_stack	*stack_b;

	if (argc == 1)
		return (0);
	if (checks(argc, argv) > 0 || argv[1][0] == '\0')
	{
		ft_putstr_fd("Error\n", 2);
		exit(1);
	}
	if (argc == 2)
		stack_a = string_to_stack(argv[1]);
	else
		stack_a = arg_to_stack(argc, argv);
	stack_b = NULL;
	read_lines(&stack_a, &stack_b);
	if (check_sorted(stack_a))
		ft_putstr_fd("OK\n", 1);
	else
		ft_putstr_fd("KO\n", 1);
	ft_free_stack((t_list **)&stack_a);
	ft_free_stack((t_list **)&stack_b);
	return (0);
}
