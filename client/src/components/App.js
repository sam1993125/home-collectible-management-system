import React, { useEffect, useState } from "react";
import { Switch, Route } from "react-router-dom";
import NavBar from "./NavBar";
import Login from "../pages/Login";
import ItemList from "../pages/ItemList";
import ItemDetails from "../pages/ItemDetails";
import NewItem from "../pages/NewItem";

function App() {
  const [user, setUser] = useState(null);

  useEffect(() => {
    // auto-login
    fetch("/me").then((r) => {
      if (r.ok) {
        r.json().then((user) => setUser(user));
      }
    });
  }, []); 

  if (!user) return <Login onLogin={setUser} />;

  return (
    <>
      <NavBar user={user} setUser={setUser} />
      <main>
        <Switch>
          <Route path="/new">
            <NewItem user={user} />
          </Route>
          <Route exact path="/">
            <ItemList user={user} />
          </Route>
          <Route path="/items/:item_id">
            <ItemDetails user={user}/>
          </Route>
        </Switch>
      </main>
    </>
  );
}

export default App;
