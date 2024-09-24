/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_lstnew.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: msumon <msumon@student.42vienna.com>       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/12/12 11:11:40 by msumon            #+#    #+#             */
/*   Updated: 2023/12/12 11:26:28 by msumon           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

t_list	*ft_lstnew(void *content)
{
	t_list	*new_node;

	new_node = (t_list *)malloc(sizeof(t_list));
	if (!new_node)
		return (NULL);
	new_node->content = content;
	new_node->next = NULL;
	return (new_node);
}

// int main(void)
// {
//     int data = 42;

//     t_list *node = ft_lstnew(&data);

//     if (node)
//     {
//         printf("Content of the node: %d\n", *(int *)node->content);
//         free(node);
//     }
//     else
//     {
//         printf("Error\n");
//         return (1);
//     }
//     return (0);
// }
