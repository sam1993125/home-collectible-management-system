import { useEffect, useState } from "react";
import { useParams, useHistory } from "react-router-dom";
import styled from "styled-components";
import { Label, FormField, Input, Button, Error, } from "../styles";

function ItemDetail() {

    const [item, setItem] = useState([])
    const [itemStatus, setItemStatus] = useState([])
    const [isLoading, setIsLoading] = useState()
    const [donating, setDonating] = useState();
    const [reportdate, setReportdate] = useState();
    const [shipping, setShipping] = useState([]);
    const [hasinvoice, setHasInvoice] = useState();

    const item_id = useParams()
    const [errors, setErrors] = useState([])

    const history = useHistory()
    

    useEffect(() => {
        fetch(`/items/${item_id.item_id}`)
            .then(response => response.json())
            .then(data => {
                setItem(data)
                setHasInvoice(item.has_invoice)
            })

        fetch(`/item_status/${item_id.item_id}`)
            .then(response => response.json())
            .then(data => {
                setItemStatus(data)
                data.map((dt) => {
                    setDonating(dt.selling_or_donating)
                    setShipping(dt.is_shipped)
                })
            })  
            console.log("I am being called")
    }, [])

    // console.log(itemStatus)
    console.log(donating)
    // console.log(shipping)

    function handleSubmit(e) {
        e.preventDefault();
        setIsLoading(true);
        fetch(`/item_status/${item_id.item_id}`, {
            method: "POST",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify({
                report_date: reportdate,
                selling_or_donating: donating,
                is_shipped:shipping,
            }),
        }).then((r) => {
            setIsLoading(false);
            if (r.ok) {
                setIsLoading(false)
                setDonating(false)
                setReportdate(false)
                window.location.reload();
            } else {
                r.json().then((err) => setErrors(err.errors));
            }
          
        });
        
    }

    function handleInvoice() {
        
        setHasInvoice(!hasinvoice)
        console.log(hasinvoice, "this is from the app")
        fetch(`/items/${item_id.item_id}`, {
            method: "PATCH",
            headers: {
                "Content-Type": "application/json",
            },
            body: JSON.stringify({
                has_invoice: hasinvoice,
            }),
        })  
            .then((r) => r.json())
            .then(data => {
                console.log(data, "From the api")
                setItem(data)
        })
            
    }

    // console.log(item)

    return (
        <Wrapper>
            <img src={item.image_url} alt={item.object_name} style={mystyle} />
            <h1>Details:</h1>
            <h4>Year: {item.object_year}</h4>
            <h4>Object Type: {item.object_type}</h4>
            <h4>Condition: {item.condition}</h4>
            <h4>Location: {item.location}</h4>
            <h4>Bought at: {item.bought_at}</h4>
            {item.has_invoice ? <Button type="primary" onClick={handleInvoice}>HAS INVOICE</Button> : <Button type="primary" onClick={handleInvoice}>NO INVOICE</Button>}
            <Divider />
            <h1>🎁🎁🎁New Donation Report!!!!!</h1>
            {itemStatus.length > 0 ? (
                itemStatus.map((itm) => (
                    <Status key={itm.id}>
                        <div>
                            <h4>Report Date: {itm.report_date}</h4>
                            <h4>Donating?: &nbsp; &nbsp; &nbsp; {itemStatus.donating}</h4>
                            <h4>Is it gone?: &nbsp; &nbsp; &nbsp;</h4>
                            {/* {donating.true ? <Button variant="outline">Yes</Button> : <Button variant="outline">No</Button>}
                            {shipping.true ? <Button variant="outline">Yes</Button> : <Button variant="outline">No</Button>}  */}
                        </div>
                    </Status>
                ))
            ) : (
                    <h1>🎁🎁🎁New Donation Report!!!!!</h1>
            )}
            <Divider />
                     <form onSubmit={handleSubmit}>
                                <FormField>
                            <Label htmlFor="bought_at">Donating?:</Label>
                            <input
                                 type="checkbox"
                                id="donating"
                                value={donating}
                                onChange={(e) => setDonating(e.target.value)}
                            />
                            </FormField>

                            <FormField>
                            <Label htmlFor="bought_at">Is it gone?:</Label>
                            <input
                                type="checkbox"
                                id="shipping"
                                value={shipping}
                                onChange={(e) => setShipping(e.target.value)}
                             />
                            </FormField>

                            <FormField>
                            <Label htmlFor="bought_at">Report Date: </Label>
                            <Input
                                type="datetime-local"
                                id="reportdate"
                                value={reportdate}
                                onChange={(e) => setReportdate(e.target.value)}
                            />
                            </FormField>
                            <FormField>
                            <Button color="primary" type="submit">
                                {isLoading ? "Loading..." : "Submit Status"}
                            </Button>
                            </FormField>
                            <FormField>
                                {errors.map((err) => (
                                    <Error key={err}>{err}</Error>
                                ))}
                            </FormField>
                        </form>
    
            
        </Wrapper>
    )
}

const Wrapper = styled.section`
  max-width: 600px;
  margin: 40px auto;
  padding: 16px;
  gap: 24px;
    box-shadow: 0 1em 1em 0.5em rgb(0 102 204 / 10%),
    0 0 0 1px rgb(10 10 10 / 2%);
`;

const Status = styled.article`  
  margin-bottom: 24px;
`;

const Divider = styled.hr`
  border: none;
  border-bottom: 1px solid #ccc;
  margin: 16px 0;
`;

const mystyle = {
    position: "relative",
    width: "100%",
    height: "100%",
}



export default ItemDetail