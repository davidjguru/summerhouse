import React from 'react';
import Chapter from './Chapter';
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

const ChapterList = () => {
  const { data } = useQuery(MyQuery);

  return (
    <div>
      {data && (
        <>
          {data.articles.items.map((chapter) => (
            <Chapter key={chapter.id} chapter={chapter} />
          ))}
        </>
      )}
    </div>
  );
};

export default ChapterList;
