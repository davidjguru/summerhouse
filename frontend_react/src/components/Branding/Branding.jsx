import React from "react";
import boxImage from '../../assets/summerhouse_logo.png'
// importing material UI components
import Container from "@mui/material/Container";
import Box from "@mui/material/Box";
  
export default function Branding() {
  return (
    <React.Fragment>
      <Container maxWidth="sm">
        <Box>
          <img src={boxImage} />
        </Box>
      </Container>
    </React.Fragment>
  );
}