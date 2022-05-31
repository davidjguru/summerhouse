import React from 'react';
import Article from './Article';
import { useQuery, gql } from '@apollo/client';

const MyQuery = gql`
  {
    articles(limit: 10, offset: 0) {
      items {
        title
        author
        id
      }
      total
    }
  }
`;

const ArticleList = () => {
  const { data } = useQuery(MyQuery);
  console.log("DATA OBJECT: ", data);
  console.log("QUERY: ", MyQuery);
  const linksToRender = [
    {
      id: 'link-id-1',
      description:
        'Prisma gives you a powerful database toolkit 😎',
      url: 'https://prisma.io'
    },
    {
      id: 'link-id-2',
      description: 'The best GraphQL client',
      url: 'https://www.apollographql.com/docs/react/'
    }
  ];

  return (
    <div>
      {data && (
        <>
          {data.articles.items.map((article) => (
            <Article key={article.id} article={article} />
          ))}
        </>
      )}
    </div>
  );
};

export default ArticleList;
