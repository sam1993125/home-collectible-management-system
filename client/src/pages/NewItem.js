import { useState } from "react";
import { useHistory } from "react-router";
import styled from "styled-components";
import ReactMarkdown from "react-markdown";
import { Button, Error, FormField, Input, Label, Textarea } from "../styles";

function NewItem({ user }) {
  const [objectName, setObjectName] = useState("Radio");
  const [objectYear, setObjectYear] = useState(1992);
  const [objectType, setObjectType] = useState("Electornic Device");
  const [objectDescription, setObjectDescription] = useState();
  const [condition, setCondition] = useState();
  const [location, setLocation] = useState();
  const [boughtat, setBoughtat] = useState();
  const [imageurl, setImageurl] = useState();
  const [errors, setErrors] = useState([]);
  const [isLoading, setIsLoading] = useState(false);
  const history = useHistory();

  function handleSubmit(e) {
    e.preventDefault();
    setIsLoading(true);
    fetch(`/users/${user.id}/items`, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
      },
      body: JSON.stringify({
        user_id: user.id,
        object_name: objectName,
        object_year: objectYear,
        object_type: objectType,
        object_description: objectDescription,
        condition: condition,
        location : location,
        bought_at: boughtat,
        image_url: imageurl,
      }),
    }).then((r) => {
      setIsLoading(false);
      if (r.ok) {
        history.push("/");
      } else {
        r.json().then((err) => setErrors(err.errors));
      }
    });
  }

  return (
    <Wrapper>
      <WrapperChild>
        <h2>Create Item</h2>
        <form onSubmit={handleSubmit}>
          <FormField>
            <Label htmlFor="image_url">Image_url</Label>
            <Input
              type="text"
              id="Image_url"
              value={imageurl}
              onChange={(e) => setImageurl(e.target.value)}
            />
          </FormField>

          <FormField>
            <Label htmlFor="objectName">Object Name</Label>
            <Input
              type="text"
              id="objectName"
              value={objectName}
              onChange={(e) => setObjectName(e.target.value)}
            />
          </FormField>

          <FormField>
            <Label htmlFor="objectYear">Object Year</Label>
            <Input
                type="number"
                id="objectYear"
                value={objectYear}
              onChange={(e) => setObjectYear(e.target.value)}
            />
          </FormField>

          <FormField>
            <Label htmlFor="objectType">Object Type</Label>
            <Input
              type="text"
              id="objectType"
              value={objectType}
              onChange={(e) => setObjectType(e.target.value)}
            />
          </FormField>

          <FormField>
            <Label htmlFor="objectDescription">Object Description</Label>
            <Input
              type="text"
              id="title"
              value={objectDescription}
              onChange={(e) => setObjectDescription(e.target.value)}
            />
          </FormField>

          <FormField>
            <Label htmlFor="condition">Condition</Label>
            <Input
              type="text"
              id="Condition"
              value={condition}
              onChange={(e) => setCondition(e.target.value)}
            />
          </FormField>

          <FormField>
            <Label htmlFor="location">location</Label>
            <Input
              type="text"
              id="location"
              value={location}
              onChange={(e) => setLocation(e.target.value)}
            />
          </FormField>

          <FormField>
            <Label htmlFor="bought_at">Bought At</Label>
            <Input
              type="text"
              id="bought_at"
              value={boughtat}
              onChange={(e) => setBoughtat(e.target.value)}
            />
          </FormField>


          <FormField>
            <Button color="primary" type="submit">
              {isLoading ? "Loading..." : "Submit Object"}
            </Button>
          </FormField>
          <FormField>
            {errors.map((err) => (
              <Error key={err}>{err}</Error>
            ))}
          </FormField>

        </form>

      </WrapperChild>
      {/* <WrapperChild>
        <h1>{objectName}</h1>
        <p>
          <em>Object Name {objectName} </em>
          &nbsp;·&nbsp;
          <cite>{user.username}</cite>
        </p> 
        <ReactMarkdown>{instructions}</ReactMarkdown>
      </WrapperChild> */}
    </Wrapper>
  );
}

const Wrapper = styled.section`

  max-width: 600px;
  margin: 40px auto;
  padding: 16px;
  display: flex;
  gap: 24px;
    box-shadow: 0 1em 1em 0.5em rgb(0 102 204 / 10%),
    0 0 0 1px rgb(10 10 10 / 2%);
`;

const WrapperChild = styled.div`
  flex: 1;
`;

export default NewItem;
