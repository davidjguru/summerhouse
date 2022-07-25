import * as React from 'react';
import { Grid } from "@mui/material"
import { styled } from '@mui/material/styles';
import Paper from '@mui/material/Paper';
import Box from '@mui/material/Box';


const Item = styled(Paper)(({ theme }) => ({
  backgroundColor: theme.palette.mode === 'dark' ? '#1A2027' : '#fff',
  ...theme.typography.body2,
  padding: theme.spacing(1),
  textAlign: 'center',
  color: theme.palette.text.secondary,
}));

export default function GridTable() {
  return (
    <Box sx={{ flexGrow: 1 }}>
      <Grid container direction="row" justifyContent="space-evenly" alignItems="baseline">
        <Grid item xs={12} sm={12} md={12} lg={12} xl={12}>
          <Item>xs=12 sm=12 md=12 lg=12 xl=12 </Item>
        </Grid>
      </Grid>
    </Box>
  );
}