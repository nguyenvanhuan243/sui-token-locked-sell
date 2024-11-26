import express from "express";
import bodyParser from "body-parser";
import WebSocket from 'ws';
const TOKEN_SUI_CONTRACT = 'CwMd3YxPdA2sQn4hHSfkK2Z4VGhA6TZdtxFLYrpXJZ2N';
import { getFullnodeUrl, SuiClient } from '@mysten/sui/client';
 
// use getFullnodeUrl to define Devnet RPC location
const rpcUrl = getFullnodeUrl('devnet');
console.log("SuiClient rpcUrl ###################", rpcUrl)
 

const app = express();
const port = process.env.PORT || 3000;
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

app.use(function (req, res) {
  res.status(404).send({ url: req.originalUrl + " not found" });
});

// const suiClient = new SuiClient({ 
//     network: 'https://fullnode.devnet.sui.io', // Example network URL
// });

// suiClient.onEvent(TOKEN_SUI_CONTRACT, 'Transfer', (event) => {
//   const transactionInfos = {
//     from: event.from,
//     to: event.to,
//     value: event.value.toString(),
//     transactionHash: event.transactionHash
//   };

//   console.log("transactionInfos", transactionInfos);
// });

app.listen(port, () => console.log(`Server connected to http://localhost:${port}`));
console.log(`🚀 🚀 🚀 🚀 => Server connected to http://localhost:${port}`);