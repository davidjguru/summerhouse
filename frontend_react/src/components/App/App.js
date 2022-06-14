import React from 'react';
import Header from '../Header/Header';
import ArticleList from '../Article/ArticleList';
import summer_house_logo from '../../assets/summer_house_logo_512.png';
import '../../styles/App.css';


function App() {
  return (
    <div className="App">
      <Header />
        <img src={summer_house_logo} className="App-logo" alt="logo" />
        <p>Welcome to Summer House, these are the latest articles created in Drupal backend, obtained through a GraphQL query.</p>
        <a className="App-link" href="https://github.com/davidjguru/summerhouse/wiki" target="_blank" rel="noopener noreferrer">Learn more about Summer House</a>
        <br></br><hr></hr>
        <br></br>
        <ArticleList />
    </div>
  );
}

export default App;
