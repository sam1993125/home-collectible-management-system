import { useState } from "react";
import styled from "styled-components";
import LoginForm from "../components/LoginForm";
import SignUpForm from "../components/SignUpForm";
import { Button } from "../styles";


function Login({ onLogin }) {
  const [showLogin, setShowLogin] = useState(true);

  return (
    <Wrap2>
    <Wrapper>
      <Logo>Have a Goodwill!</Logo>
      {showLogin ? (
        <>
          <LoginForm onLogin={onLogin} />
          <Divider />
          <p>
            Don't have an account? &nbsp;
            <Button color="secondary" onClick={() => setShowLogin(false)}>
              Sign Up
            </Button>
          </p>

        </>
      ) : (
        <>
          <SignUpForm onLogin={onLogin} />
          <Divider />
          <p>
            Already have an account? &nbsp;
            <Button color="secondary" onClick={() => setShowLogin(true)}>
              Log In
            </Button>
          </p>
        </>
      )}
  </Wrapper>
          </Wrap2>
  );
}

const Logo = styled.h1`
  
  color: #238; 
  font-family: 'Futura', sans-serif; 
  font-size: 50px; 
  font-weight: bold; 
  letter-spacing: -1px; 
  line-height: 1; 
  text-align: center; 
`;

const Wrapper = styled.div`
  max-width: 600px;
  margin: 70px auto;
  padding: 40px;
  box-shadow: 0 1em 1em 0.5em rgb(0 102 204 / 10%),
    0 0 0 1px rgb(10 10 10 / 2%);
`;

const Wrap2 = styled.div`

margin: 70px auto;
padding: 40px;
`;

const Divider = styled.hr`

  border: none;
  border-bottom: 1px solid #ccc;
  margin: 16px 0;
`;


export default Login;
