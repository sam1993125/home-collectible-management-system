import React from "react";
import { Link } from "react-router-dom";
import styled from "styled-components";
import { Button } from "../styles";

function NavBar({ setUser }) {
  function handleLogoutClick() {
    fetch("/logout", { method: "DELETE" }).then((r) => {
      if (r.ok) {
        setUser(null);
      }
    });
  }



  return (
    <Wrapper>
      <Logo>
        <Link to="/">Have a Goodwill!</Link>
      </Logo>
      <Nav>
        <Button as={Link} to="/new">
          New Items
        </Button>
        <Button variant="outline" onClick={handleLogoutClick}>
          Logout
        </Button>
      </Nav>
    </Wrapper>
  );
}

const Wrapper = styled.header`
  display: flex;
  justify-content: center;
  align-items: center;
  padding: 8px;
`;

const Logo = styled.h2`
   &:hover {
    opacity: 0.9;
  }
  font-family: 'Futura', sans-serif; 
  text-decroration:none;
  font-size: 50px; 
  font-weight: bold; 
  letter-spacing: -1px; 
  line-height: 1; 
  text-align: center; 
`;

const Nav = styled.nav`

  display: flex;
  gap: 4px;
  position: absolute;
  right: 8px;
`;

export default NavBar;
