import React from 'react';
import { ChapterItem } from './ChapterItem';
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

export function ChapterList() {

  const { data } = useQuery(MyQuery);
  return (
      <ul>
        {data && (
          <>
          {data.articles.items.map((chapter) => (
            <ChapterItem key={chapter.id} id={chapter.id} title={chapter.title} />
          ))}
          </>
        )}
      </ul>

  );
}
