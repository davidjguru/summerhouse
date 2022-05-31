import ArticleList from './ArticleList';
import summer_house_logo from './../assets/summer_house_logo_512.png';
import './../styles/App.css';


function App() {
  return (
    <div className="App">
      <header className="App-header">
        <img src={summer_house_logo} className="App-logo" alt="logo" />
        <p>Edit <code>src/App.js</code> and save to reload.</p>
        <a className="App-link" href="https://reactjs.org" target="_blank" rel="noopener noreferrer">Learn React</a>
        <ArticleList />
      </header>
    </div>
  );
}

export default App;
