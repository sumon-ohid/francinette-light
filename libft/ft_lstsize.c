/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_lstsize.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: msumon <msumon@student.42vienna.com>       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/12/12 11:46:37 by msumon            #+#    #+#             */
/*   Updated: 2023/12/12 12:31:25 by msumon           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

int	ft_lstsize(t_list *lst)
{
	int	size;

	size = 0;
	while (lst)
	{
		size++;
		lst = lst->next;
	}
	return (size);
}

// int	main(void)
// {
// 	t_list	*list;
// 	t_list	*node1;
// 	t_list	*node2;
// 	t_list	*node3;
// 	int		size;

// 	list = NULL;
// 	node1 = ft_lstnew("Node 1");
// 	node2 = ft_lstnew("Node 2");
// 	node3 = ft_lstnew("Node 3");
// 	if (!node1 || !node2 || !node3)
// 	{
// 		printf("Failed to create one or more nodes\n");
// 		return (1);
// 	}
// 	ft_lstadd_front(&list, node3);
// 	ft_lstadd_front(&list, node2);
// 	ft_lstadd_front(&list, node1);
// 	size = ft_lstsize(list);
// 	printf("Size of the list: %d\n", size);
// 	return (0);
// }
