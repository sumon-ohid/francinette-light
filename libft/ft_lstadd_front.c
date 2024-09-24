/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_lstadd_front.c                                  :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: msumon <msumon@student.42vienna.com>       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/12/12 11:27:13 by msumon            #+#    #+#             */
/*   Updated: 2023/12/12 11:45:32 by msumon           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

void	ft_lstadd_front(t_list **lst, t_list *new)
{
	if (lst && new)
	{
		new->next = *lst;
		*lst = new;
	}
}

// int main(void)
// {
//     t_list *list = NULL;
//     t_list *new_node;
//     int data = 42;

//     new_node = ft_lstnew(&data);
//     if (!new_node)
//         return (1);

//     printf("List before adding a node: %p\n", new_node->content);
//     ft_lstadd_front(&list, new_node);
//     printf("List after adding a node: %p\n", list->content);
//     free(list);
//     return (0);
// }