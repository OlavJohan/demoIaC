import { useState } from 'react';

const APIURL = process.env.REACT_APP_FYLKESAPI_ENDEPUNKT;

function App() {

  const [fylker, setFylker] = useState([]);

  function hentFylker() {
    async function callAPI() {
      const response = await fetch(`${APIURL}/getFylker`);
      return response.json();
    }
    
    callAPI().then(data => {
      setFylker(data);
    });
  } 

  return (
    <div>
      <button onClick={hentFylker}>Hent fylker</button>
      <ul>
        {fylker.map(fylke => <li key={fylke["Fylkenavn"]}>{fylke["Fylkenavn"]}</li>)}
      </ul>
    </div>
  );
}

export default App;
