import React from 'react';

export function ChapterItem({ id, title }) {
  
  return (
    <li>
      <input type="checkbox" />
      {id} - {title}
    </li>
  );
}