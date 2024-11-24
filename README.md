# Mint token
```
sui client call --function mint --args 0x5857dbf356c823e173d20419e58acc6216c32c3c067e98a28deca1acdbec28fd 90000 0xa907549d1221e935cd2f4cd1e910e49a16abdfe6f9a328c764c712df7257888b --module managed --package 0xbba3af28b027ac19274dacf2fa6fb673181e68842f410b495e41e848d8bae1aa --gas-budget 300000000
```
# sui client call --function mint --module mycoin --package <PACKAGE-ID> --args <TREASURY-CAP-ID> <COIN-AMOUNT> <RECIPIENT-ADDRESS> --gas-budget <GAS-AMOUNT>
# Mint token
     ObjectID: 0xacd6e867ba46681ed5d7bedcb4e68742135ed353c08c3ba3fe8c0122842657f2                                                        │
│  │ Sender: 0xfc88562ea9e9790adb886aed3a47ebc8025c912ba913a2839c235df2b4909a21                                                          │
│  │ Owner: Account Address ( 0xfc88562ea9e9790adb886aed3a47ebc8025c912ba913a2839c235df2b4909a21 )                                       │
│  │ ObjectType: 0x2::coin::TreasuryCap<0x67a72dd3201a1f519a5f84327c2b66b0a4c8aeaab5435e13ca46c8ea813ef562::managed::MANAGED>            │
│  │ Version: 190                                                                                                                        │
│  │ Digest: CHoz6R7q3oUcNdGDvyTCuS83EaUivNFpHbdvgJUNR9JQ          
    {
        object: 0x5857dbf356c823e173d20419e58acc6216c32c3c067e98a28deca1acdbec28fd
        pack_id: 0xbba3af28b027ac19274dacf2fa6fb673181e68842f410b495e41e848d8bae1aa
    }

# Deploy/publish token
```
sui client publish
```

# Refer quanIT
```
https://www.youtube.com/watch?v=TsFkES2FCZQ
```

# HomePage
```
https://docs.sui.io/guides/developer/coin
```

## Compare coin and token
![image](https://github.com/user-attachments/assets/7ccb50c0-85bf-4c50-add7-90927ceffa1a)

## Editor
https://docs.welldonestudio.io/code/deploy-and-run/sui/#connect-to-welldone-code

## Access sui
https://remix.ethereum.org/?#activate=wds-code-remix&lang=en&optimize=false&runs=200&evmVersion=null&version=soljson-v0.8.26+commit.8a97fa7a.js

## Can use remix
![image](https://github.com/user-attachments/assets/9c0afab5-1b2b-4386-8168-713ac3bbc4d8)

- convert to dev setting if you are using dev mode
![image](https://github.com/user-attachments/assets/57b8d64e-a057-4ae2-8561-0522009dbf76)

# Movestudio
- https://www.movestudio.dev/


# To use these functions, you pass the DenyList object (0x403), your DenyCap object ID, and the address you want to either add or remove. Using the Sui CLI, you could use sui client call with the required information:

sui client call --function remove_addr_from_deny_list --module managed --package 0xe23dd5e38476eb1cfab3a871af81a2f5b26c5825bbf2a748f7bc540f3fb89b97 --args 0x403 0x1661349e088108fe9a8c83031a08d7634203c06bbf634bc369440017908cbb09 0xa907549d1221e935cd2f4cd1e910e49a16abdfe6f9a328c764c712df7257888b --gas-budget 300000000

sui client call --function remove_addr_from_deny_list --module managed --package 0xe23dd5e38476eb1cfab3a871af81a2f5b26c5825bbf2a748f7bc540f3fb89b97 --args 0x403 0x1661349e088108fe9a8c83031a08d7634203c06bbf634bc369440017908cbb09 0xa907549d1221e935cd2f4cd1e910e49a16abdfe6f9a328c764c712df7257888b --gas-budget 300000000

sui client call --function mint --args 0xc1ed93ecf7fff639181b2f8da6be5ccd9817cd8829604473ddd53cdadc6b6da4 1234567000000 0xa907549d1221e935cd2f4cd1e910e49a16abdfe6f9a328c764c712df7257888b --module managed --package 0xe23dd5e38476eb1cfab3a871af81a2f5b26c5825bbf2a748f7bc540f3fb89b97 --gas-budget 300000000

https://docs.sui.io/guides/developer/coin/regulated



# Call remove address to deny list

 ObjectID: <OBJECT-ID>
   Sender: <SENDER-ADDR>
   Owner: Account Address ( <PUBLISHER-ADDRESS )
   ObjectType: 0x2::coin::DenyCap<<PACKAGE-ID>::regcoin::REGCOIN>
   Version: <VERSION-NUMBER>
   Digest: <DIGEST-HASH>
┌──                                                                                                                                   │
│  │ ObjectID: 0x250c7482662b13f6681ac1f049d555d4bc342e35e7f543a99b511c312779c707                                                        │
│  │ Sender: 0xfc88562ea9e9790adb886aed3a47ebc8025c912ba913a2839c235df2b4909a21                                                          │
│  │ Owner: Account Address ( 0xfc88562ea9e9790adb886aed3a47ebc8025c912ba913a2839c235df2b4909a21 )                                       │
│  │ ObjectType: 0x2::coin::DenyCapV2<0x1a335cd4c08ac1d8dc3cf467b147f144dbd95cdcc1391bf11d51837806fea0e4::managed::MANAGED>              │
│  │ Version: 226                                                                                                                        │
│  │ Digest: 4ZzqxBKpaYUmUjobSXUqStJh9tN4ZjUZBvwuK6jGVA5d                                                                                │
│  └──                                                 

sui client call --function remove_addr_from_deny_list --module managed --package "DenyCapV2_PACK_ID" --args "0x403" "DenyCapV2_ObjectID" "DENY_ADDRESS" --gas-budget 300000000

# Best editor
- https://ide.bitslab.xyz/