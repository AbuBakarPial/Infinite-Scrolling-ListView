
# Infinity ListView with API and Provider

Simple Flutter app that displays a list of items. Users can tap the item to see a detailed view of it. Uses https://picsum.photos/v2/list?page=pageNumber&limit=20 to get a list of items with infinite scrolling. 

Each hit will contain 20 items. The list item will contain only the id and author. Full information can be found on the detail page. You don’t have to show the images; just show the image URLs as clickable links.


## API Reference

#### Get all items

```http
  GET https://picsum.photos/v2/list?page=
```

| Parameter | Type     | Description                |
| :-------- | :------- | :------------------------- |
| `page` | `Integer` | **Required :** 1 |

#### Limit item

```http
 &limit=
```

| Parameter | Type     | Description                       |
| :-------- | :------- | :-------------------------------- |
| `limit`      | `Integer` | **As Required :** 20 |



## Screen 1

![App Screenshot](screenshot/screen1.png)


## Screen 2

![App Screenshot](screenshot/screen2.png)


## 🔗 Links
[![portfolio](https://img.shields.io/badge/my_portfolio-000?style=for-the-badge&logo=ko-fi&logoColor=white)](https://katherinempeterson.com/)
[![linkedin](https://img.shields.io/badge/linkedin-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/)
[![twitter](https://img.shields.io/badge/twitter-1DA1F2?style=for-the-badge&logo=twitter&logoColor=white)](https://twitter.com/)

