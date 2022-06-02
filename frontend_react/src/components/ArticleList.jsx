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
