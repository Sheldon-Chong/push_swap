/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   parsing.c                                          :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: shechong <shechong@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/06/19 19:05:23 by shechong          #+#    #+#             */
/*   Updated: 2023/07/18 13:38:43 by shechong         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "push_swap.h"
#include <stdio.h>

int	checks(int ac, char **av)
{
	int	i;
	int	i2;
	int	set;

	i = 1;
	if (ac == 2)
		av = ft_split(av[(--i) + 1], ' ');
	if (!av[0])
		return (ft_free_array((void **)av, 2, 1 - i));
	if ((ft_ibounds(ft_atol(av[i])) == 0
			|| (ft_is_charset(av[i], "0123456789-+") == 0)))
		return (ft_free_array((void **)av, 1, 0 - i));
	if (!av[1])
		return (ft_free_array((void **)av, 2, 1 - i));
	set = i;
	while (av[++i])
	{
		i2 = set - 1;
		while (++i2 < ac)
			if ((ft_atol(av[i]) == ft_atol(av[i2]) && i != i2)
				|| (ft_ibounds(ft_atol(av[i])) == 0)
				|| ft_is_charset(av[i], "0123456789-+") == 0)
				return (ft_free_array((void **)av, 1, 1 - i));
	}
	return (ft_free_array((void **)av, 0, 0 - set));
}

t_stack	*node_init(t_stack *node, int index, int number, t_stack *next)
{
	node->next = next;
	node->num = number;
	node->index = index;
	return (node);
}

t_stack	*arg_to_stack(int ac, char **av)
{
	int		i;
	t_stack	*head;
	t_stack	*node1;

	head = (t_stack *)malloc(sizeof(t_stack));
	if (!head || ac < 1)
		return (free_and_return(head, NULL));
	node_init(head, 0, ft_atoi(av[1]), NULL);
	i = 2;
	while (av[i])
	{
		node1 = (t_stack *)malloc(sizeof(t_stack));
		if (!node1)
		{
			ft_free_stack((t_list **)&head);
			return (free_and_return(head, NULL));
		}
		node1->next = 0;
		node1->num = ft_atoi(av[i]);
		node1->index = 0;
		add_node_back(&head, node1);
		i++;
	}
	return (head);
}

t_stack	*string_to_stack(char *str)
{
	int		i;
	t_stack	*head;
	t_stack	*node1;
	char	**list;

	head = ft_calloc(1, sizeof(t_stack));
	list = ft_split(str, ' ');
	node_init(head, 0, ft_atoi(list[0]), NULL);
	i = 0;
	while (list[++i])
	{
		node1 = (t_stack *)malloc(sizeof(t_stack));
		if (!node1)
		{
			ft_free_array((void **)list, 1, 1);
			return (free_and_return(head, NULL));
		}
		node1->next = NULL;
		node1->num = ft_atoi(list[i]);
		node1->index = 0;
		add_node_back(&head, node1);
	}
	ft_free_array((void **)list, 1, 1);
	return (head);
}

void	assign_index(t_stack *stack_a, int stack_size)
{
	t_stack	*ptr;
	t_stack	*highest;
	int		value;

	while (--stack_size > 0)
	{
		ptr = stack_a;
		value = INT_MIN;
		highest = NULL;
		while (ptr)
		{
			if (ptr->num == INT_MIN && ptr->index == 0)
				ptr->index = 1;
			if (ptr->num > value && ptr->index == 0)
			{
				value = ptr->num;
				highest = ptr;
				ptr = stack_a;
			}
			else
				ptr = ptr->next;
		}
		if (highest != NULL)
			highest->index = stack_size;
	}
}
