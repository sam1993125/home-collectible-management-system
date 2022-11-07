import { useEffect, useState } from "react";
import ReactMarkdown from "react-markdown";
import { Link } from "react-router-dom";
import styled from "styled-components";
import { Box, Button } from "../styles";

function ItemList({ user }) {
  const [items, setItems] = useState([]);

  useEffect(() => {
    fetch(`/users/${user.id}/items`)
      .then((r) => r.json())
      .then(data=>setItems(data));
  }, []);


  function onHandleDelete(id) {
    console.log(id)
    fetch(`/items/${id}`, {
      method: 'DELETE'
    })
      .then(r => {
        if (r.ok) {
          setItems(items => items.filter(itm => itm.id !== id))
        }
      })
  }


  return (

    <Wrapper >
      {items.length > 0 ? (
        items.map((item) => (
          <Items key={item.id}>
            <Box >
              <h2>
                <Link to={`/items/${item.id}`}>{item.object_name}</Link>
                </h2>
              <button onClick={() => onHandleDelete(item.id)}>🗑</button>
              <img src={item.image_url} alt={item.object_name} 
                style={mystyle}/> 
              <ReactMarkdown>{item.object_description}</ReactMarkdown>
            </Box>
          </Items>
        ))
      ) : (
        <>
            &nbsp; &nbsp; &nbsp;
          <Button as={Link} to="/new">
            Make a New Donation!
          </Button>
        </>
      )} 
    </Wrapper>
  );
}

const Wrapper = styled.section`
  display: grid;
  grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
  grid-template-rows: auto;
  gap: 20px;
  max-width: 1200px;
  margin: 80px auto;
  padding: 16px;
`;

const Items = styled.article`  
  margin-bottom: 24px;
`;

const mystyle = {
  position: "relative",
  width: "100%",
  height: "100%",
}


export default ItemList;
