import React from 'react';
import Header from '../Header/Header';
import ArticleList from '../Article/ArticleList';
import summer_house_logo from '../../assets/summer_house_logo_512.png';
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
        <ArticleList />
    </div>
  );
}

export default App;
