import React from 'react';
import Header from '../Header/Header';
import ChapterList from '../Chapter/ChapterList';
import '../../styles/App.css';
import Branding from '../Branding/Branding';


function App() {
  return (
    <div className="App">
      <Header />
        <Branding />
        <p>Welcome to Summer House, these are the latest articles created in Drupal backend, obtained through a GraphQL query.</p>
        <p>Can you see the list of items? If not, try reloading the current page.</p>
        <a className="App-link" href="http://summerhouse.ddev.site:8091/Home/" target="_blank" rel="noopener noreferrer">Learn more about Summer House</a>
        <br></br><hr></hr>
        <br></br>
        <ChapterList />
    </div>
  );
}

export default App;
