import React, { useEffect, useState} from 'react';
import { getCharacters } from 'rickmortyapi';
 
async function loadResources() {
  const aliveRicks = await getCharacters({
    name: 'rick',
    status: 'alive'
  });
  return aliveRicks;
}
export function ChapterItem({ id, title }) {
const loading = loadResources();
console.log(loading);
const imageSource = "https://picsum.photos/200";
  return (
    <li>
      <div className="card">
        <img src={imageSource} alt="Avatar" />
          <div className="container">
            <h4><b>{id}</b></h4>
            <p>{title}</p>
          </div>
      </div> 
    </li>
  );
}