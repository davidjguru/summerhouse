import React from 'react';

export function ChapterItem({ id, title }) {
  {/* Load the basic parameters of a chapter item */}
  
  return (
    <li>
      <input type="checkbox" />
      {id} - {title}
    </li>
  );
}