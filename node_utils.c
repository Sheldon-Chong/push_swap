/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   node_utils.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: shechong <shechong@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/06/19 19:06:00 by shechong          #+#    #+#             */
/*   Updated: 2023/06/23 20:06:09 by shechong         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "push_swap.h"

void	add_node_back(t_stack **lst, t_stack *new_node)
{
	t_stack	*head;

	if (*lst == NULL)
	{
		*lst = new_node;
		return ;
	}
	head = *lst;
	while (head->next)
		head = head->next;
	head->next = new_node;
}

int	list_size(t_stack *lst)
{
	t_stack	*current;
	int		i;

	current = lst;
	i = 0;
	while (current)
	{
		current = current->next;
		i ++;
	}
	return (i);
}

t_stack	*last_node(t_stack **lst)
{
	t_stack	*current;

	if (lst == NULL)
		return (NULL);
	current = *lst;
	while (current->next)
		current = current->next;
	return (current);
}

int	check_sorted(t_stack *head)
{
	t_stack	*current;
	int		i;

	i = 0;
	current = head;
	if (head == NULL || head->next == NULL)
		return (1);
	while (current->next != NULL)
	{
		if (current->num > current->next->num)
			return (0);
		current = current->next;
		i ++;
	}
	return (1);
}

t_stack	*findsmall(t_stack **stack, int minimum)
{
	t_stack		*ret;
	t_stack		*current;
	int			num;

	num = 2147483647;
	ret = *stack;
	current = *stack;
	while (current)
	{
		if (current->num < num && current->num > minimum)
		{
			ret = current;
			num = current->num;
		}
		current = current->next;
	}
	return (ret);
}
