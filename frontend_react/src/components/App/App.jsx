import React, { Fragment, useState, useRef, useEffect } from 'react';
import { v4 as uuidv4 } from 'uuid';
import Header from '../Header/Header';
import { ChapterList } from '../Chapter/ChapterList';
import '../../styles/App.css';
import Branding from '../Branding/Branding';

export function App() {

  return (
    <div className="App">
      <Header />
        <Branding />
    <Fragment>
      <ChapterList />
    </Fragment>
  </div>
  );
  }
