import styled from "styled-components";

const COLORS = {
  primary: {
    "--main": "navy",
    "--accent": "white",
  },
  secondary: {
    "--main": "C4A484",
    "--accent": "navy",
  },
};

function Button({ variant = "fill", color = "primary", ...props }) {
  let Component;
  if (variant === "fill") {
    Component = FillButton;
  } else if (variant === "outline") {
    Component = OutlineButton;
  }

  return <Component style={COLORS[color]} {...props} />;
}

const ButtonBase = styled.button`
  cursor: pointer;
  font-size: 1rem;
  border: 1px solid transparent;
  border-radius: 6px;
  padding: 8px 16px;
  text-decoration: none;
  text-align: center;
`;

const FillButton = styled(ButtonBase)`
  background-color: var(--main);
  color: var(--accent);
  font-family: 'Futura', sans-serif; 
  &:hover {
    opacity: 0.9;
  }
`;

const OutlineButton = styled(ButtonBase)`
  background-color: white;
  color: var(--main);
  border: 2px solid var(--main);

  &:hover {
    background: hsl(235deg 85% 97%);
  }
`;

export default Button;
