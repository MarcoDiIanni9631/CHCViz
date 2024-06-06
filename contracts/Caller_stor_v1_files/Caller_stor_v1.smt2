(set-logic HORN)
(declare-datatypes ((|bytes_tuple| 0)) (((|bytes_tuple| (|bytes_tuple_accessor_array| (Array Int Int)) (|bytes_tuple_accessor_length| Int)))))
(declare-datatypes ((|tx_type| 0)) (((|tx_type| (|block.basefee| Int) (|block.chainid| Int) (|block.coinbase| Int) (|block.gaslimit| Int) (|block.number| Int) (|block.prevrandao| Int) (|block.timestamp| Int) (|blockhash| (Array Int Int)) (|msg.data| |bytes_tuple|) (|msg.sender| Int) (|msg.sig| Int) (|msg.value| Int) (|tx.gasprice| Int) (|tx.origin| Int)))))
(declare-datatypes ((|ecrecover_input_type| 0)) (((|ecrecover_input_type| (|hash| Int) (|v| Int) (|r| Int) (|s| Int)))))
(declare-datatypes ((|crypto_type| 0)) (((|crypto_type| (|ecrecover| (Array |ecrecover_input_type| Int)) (|keccak256| (Array |bytes_tuple| Int)) (|ripemd160| (Array |bytes_tuple| Int)) (|sha256| (Array |bytes_tuple| Int))))))
(declare-datatypes ((|abi_type| 0)) (((|abi_type|))))
(declare-datatypes ((|state_type| 0)) (((|state_type| (|balances| (Array Int Int))))))
(declare-fun |interface_0_CallWrapper_28_0| (Int |abi_type| |crypto_type| |state_type| Int ) Bool)
(declare-fun |nondet_interface_1_CallWrapper_28_0| (Int Int |abi_type| |crypto_type| |state_type| Int |state_type| Int ) Bool)
(declare-fun |summary_constructor_2_CallWrapper_28_0| (Int Int |abi_type| |crypto_type| |tx_type| |state_type| |state_type| Int Int ) Bool)
(assert
(forall ( (abi_0 |abi_type|) (crypto_0 |crypto_type|) (data_4_0 Int) (error_0 Int) (state_0 |state_type|) (this_0 Int) (tx_0 |tx_type|))
(=> (= error_0 0) (nondet_interface_1_CallWrapper_28_0 error_0 this_0 abi_0 crypto_0 state_0 data_4_0 state_0 data_4_0))))


(declare-fun |summary_3_function_callwrap__27_28_0| (Int Int |abi_type| |crypto_type| |tx_type| |state_type| Int Int |state_type| Int Int ) Bool)
(declare-fun |summary_4_function_callwrap__27_28_0| (Int Int |abi_type| |crypto_type| |tx_type| |state_type| Int Int |state_type| Int Int ) Bool)
(assert
(forall ( (abi_0 |abi_type|) (called_6_0 Int) (called_6_1 Int) (crypto_0 |crypto_type|) (data_4_0 Int) (data_4_1 Int) (data_4_2 Int) (error_0 Int) (error_1 Int) (state_0 |state_type|) (state_1 |state_type|) (state_2 |state_type|) (this_0 Int) (tx_0 |tx_type|))
(=> (and (and (nondet_interface_1_CallWrapper_28_0 error_0 this_0 abi_0 crypto_0 state_0 data_4_0 state_1 data_4_1) true) (and (= error_0 0) (summary_4_function_callwrap__27_28_0 error_1 this_0 abi_0 crypto_0 tx_0 state_1 data_4_1 called_6_0 state_2 data_4_2 called_6_1))) (nondet_interface_1_CallWrapper_28_0 error_1 this_0 abi_0 crypto_0 state_0 data_4_0 state_2 data_4_2))))


(declare-fun |block_5_function_callwrap__27_28_0| (Int Int |abi_type| |crypto_type| |tx_type| |state_type| Int Int |state_type| Int Int Int ) Bool)
(declare-fun |block_6_callwrap_26_28_0| (Int Int |abi_type| |crypto_type| |tx_type| |state_type| Int Int |state_type| Int Int Int ) Bool)
(assert
(forall ( (_data_11_0 Int) (_data_11_1 Int) (abi_0 |abi_type|) (called_6_0 Int) (called_6_1 Int) (crypto_0 |crypto_type|) (data_4_0 Int) (data_4_1 Int) (data_4_2 Int) (error_0 Int) (error_1 Int) (state_0 |state_type|) (state_1 |state_type|) (state_2 |state_type|) (this_0 Int) (tx_0 |tx_type|))
(block_5_function_callwrap__27_28_0 error_0 this_0 abi_0 crypto_0 tx_0 state_0 data_4_0 called_6_0 state_1 data_4_1 called_6_1 _data_11_1)))


(assert
(forall ( (_data_11_0 Int) (_data_11_1 Int) (abi_0 |abi_type|) (called_6_0 Int) (called_6_1 Int) (crypto_0 |crypto_type|) (data_4_0 Int) (data_4_1 Int) (data_4_2 Int) (error_0 Int) (error_1 Int) (state_0 |state_type|) (state_1 |state_type|) (state_2 |state_type|) (this_0 Int) (tx_0 |tx_type|))
(=> (and (and (block_5_function_callwrap__27_28_0 error_0 this_0 abi_0 crypto_0 tx_0 state_0 data_4_0 called_6_0 state_1 data_4_1 called_6_1 _data_11_1) (and (and (and (and (= state_1 state_0) (= error_0 0)) (and true (= data_4_1 data_4_0))) (and true (= called_6_1 called_6_0))) true)) true) (block_6_callwrap_26_28_0 error_0 this_0 abi_0 crypto_0 tx_0 state_0 data_4_0 called_6_0 state_1 data_4_1 called_6_1 _data_11_1))))


(declare-fun |block_7_return_function_callwrap__27_28_0| (Int Int |abi_type| |crypto_type| |tx_type| |state_type| Int Int |state_type| Int Int Int ) Bool)
(declare-fun |nondet_call_8_0| (Int Int |abi_type| |crypto_type| |state_type| Int |state_type| Int ) Bool)
(assert
(forall ( (_data_11_0 Int) (_data_11_1 Int) (_data_11_2 Int) (abi_0 |abi_type|) (called_6_0 Int) (called_6_1 Int) (crypto_0 |crypto_type|) (data_4_0 Int) (data_4_1 Int) (data_4_2 Int) (error_0 Int) (error_1 Int) (expr_12_0 Int) (expr_14_0 Int) (expr_17_length_pair_0 |bytes_tuple|) (state_0 |state_type|) (state_1 |state_type|) (state_2 |state_type|) (this_0 Int) (tx_0 |tx_type|))
(=> (nondet_interface_1_CallWrapper_28_0 error_1 this_0 abi_0 crypto_0 state_1 data_4_1 state_2 data_4_2) (nondet_call_8_0 error_1 this_0 abi_0 crypto_0 state_1 data_4_1 state_2 data_4_2))))


(assert
(forall ( (_data_11_0 Int) (_data_11_1 Int) (_data_11_2 Int) (abi_0 |abi_type|) (called_6_0 Int) (called_6_1 Int) (crypto_0 |crypto_type|) (data_4_0 Int) (data_4_1 Int) (data_4_2 Int) (error_0 Int) (error_1 Int) (expr_12_0 Int) (expr_14_0 Int) (expr_17_length_pair_0 |bytes_tuple|) (state_0 |state_type|) (state_1 |state_type|) (state_2 |state_type|) (this_0 Int) (tx_0 |tx_type|))
(=> (and (and (block_6_callwrap_26_28_0 error_0 this_0 abi_0 crypto_0 tx_0 state_0 data_4_0 called_6_0 state_1 data_4_1 called_6_1 _data_11_1) (and (nondet_call_8_0 error_1 this_0 abi_0 crypto_0 state_1 data_4_1 state_2 data_4_2) (and (= (|bytes_tuple_accessor_length| expr_17_length_pair_0) 0) (and (=> true (and (>= expr_14_0 0) (<= expr_14_0 1461501637330902918203684832716283019655932542975))) (and (= expr_14_0 called_6_1) (and (= _data_11_2 expr_12_0) (and (=> true (and (>= expr_12_0 0) (<= expr_12_0 115792089237316195423570985008687907853269984665640564039457584007913129639935))) (and (= expr_12_0 data_4_1) (and (and (>= called_6_1 0) (<= called_6_1 1461501637330902918203684832716283019655932542975)) (and (= _data_11_1 0) true)))))))))) (and (> error_1 0) true)) (summary_3_function_callwrap__27_28_0 error_1 this_0 abi_0 crypto_0 tx_0 state_0 data_4_0 called_6_0 state_2 data_4_2 called_6_1))))


(declare-fun |block_9_function_callwrap__27_28_0| (Int Int |abi_type| |crypto_type| |tx_type| |state_type| Int Int |state_type| Int Int Int ) Bool)
(assert
(forall ( (_data_11_0 Int) (_data_11_1 Int) (_data_11_2 Int) (abi_0 |abi_type|) (called_6_0 Int) (called_6_1 Int) (crypto_0 |crypto_type|) (data_4_0 Int) (data_4_1 Int) (data_4_2 Int) (error_0 Int) (error_1 Int) (error_2 Int) (expr_12_0 Int) (expr_14_0 Int) (expr_17_length_pair_0 |bytes_tuple|) (expr_21_0 Int) (expr_22_0 Int) (expr_23_1 Bool) (state_0 |state_type|) (state_1 |state_type|) (state_2 |state_type|) (this_0 Int) (tx_0 |tx_type|))
(=> (and (and (block_6_callwrap_26_28_0 error_0 this_0 abi_0 crypto_0 tx_0 state_0 data_4_0 called_6_0 state_1 data_4_1 called_6_1 _data_11_1) (and (= expr_23_1 (= expr_21_0 expr_22_0)) (and (=> true (and (>= expr_22_0 0) (<= expr_22_0 115792089237316195423570985008687907853269984665640564039457584007913129639935))) (and (= expr_22_0 data_4_2) (and (=> true (and (>= expr_21_0 0) (<= expr_21_0 115792089237316195423570985008687907853269984665640564039457584007913129639935))) (and (= expr_21_0 _data_11_2) (and (= error_1 0) (and (nondet_call_8_0 error_1 this_0 abi_0 crypto_0 state_1 data_4_1 state_2 data_4_2) (and (= (|bytes_tuple_accessor_length| expr_17_length_pair_0) 0) (and (=> true (and (>= expr_14_0 0) (<= expr_14_0 1461501637330902918203684832716283019655932542975))) (and (= expr_14_0 called_6_1) (and (= _data_11_2 expr_12_0) (and (=> true (and (>= expr_12_0 0) (<= expr_12_0 115792089237316195423570985008687907853269984665640564039457584007913129639935))) (and (= expr_12_0 data_4_1) (and (and (>= called_6_1 0) (<= called_6_1 1461501637330902918203684832716283019655932542975)) (and (= _data_11_1 0) true)))))))))))))))) (and (and true (not expr_23_1)) (= error_2 1))) (block_9_function_callwrap__27_28_0 error_2 this_0 abi_0 crypto_0 tx_0 state_0 data_4_0 called_6_0 state_2 data_4_2 called_6_1 _data_11_2))))


(assert
(forall ( (_data_11_0 Int) (_data_11_1 Int) (_data_11_2 Int) (abi_0 |abi_type|) (called_6_0 Int) (called_6_1 Int) (crypto_0 |crypto_type|) (data_4_0 Int) (data_4_1 Int) (data_4_2 Int) (error_0 Int) (error_1 Int) (error_2 Int) (expr_12_0 Int) (expr_14_0 Int) (expr_17_length_pair_0 |bytes_tuple|) (expr_21_0 Int) (expr_22_0 Int) (expr_23_1 Bool) (state_0 |state_type|) (state_1 |state_type|) (state_2 |state_type|) (this_0 Int) (tx_0 |tx_type|))
(=> (block_9_function_callwrap__27_28_0 error_2 this_0 abi_0 crypto_0 tx_0 state_0 data_4_0 called_6_0 state_2 data_4_2 called_6_1 _data_11_2) (summary_3_function_callwrap__27_28_0 error_2 this_0 abi_0 crypto_0 tx_0 state_0 data_4_0 called_6_0 state_2 data_4_2 called_6_1))))


(assert
(forall ( (_data_11_0 Int) (_data_11_1 Int) (_data_11_2 Int) (abi_0 |abi_type|) (called_6_0 Int) (called_6_1 Int) (crypto_0 |crypto_type|) (data_4_0 Int) (data_4_1 Int) (data_4_2 Int) (error_0 Int) (error_1 Int) (error_2 Int) (expr_12_0 Int) (expr_14_0 Int) (expr_17_length_pair_0 |bytes_tuple|) (expr_21_0 Int) (expr_22_0 Int) (expr_23_1 Bool) (state_0 |state_type|) (state_1 |state_type|) (state_2 |state_type|) (this_0 Int) (tx_0 |tx_type|))
(=> (and (and (block_6_callwrap_26_28_0 error_0 this_0 abi_0 crypto_0 tx_0 state_0 data_4_0 called_6_0 state_1 data_4_1 called_6_1 _data_11_1) (and (= error_2 error_1) (and (= expr_23_1 (= expr_21_0 expr_22_0)) (and (=> true (and (>= expr_22_0 0) (<= expr_22_0 115792089237316195423570985008687907853269984665640564039457584007913129639935))) (and (= expr_22_0 data_4_2) (and (=> true (and (>= expr_21_0 0) (<= expr_21_0 115792089237316195423570985008687907853269984665640564039457584007913129639935))) (and (= expr_21_0 _data_11_2) (and (= error_1 0) (and (nondet_call_8_0 error_1 this_0 abi_0 crypto_0 state_1 data_4_1 state_2 data_4_2) (and (= (|bytes_tuple_accessor_length| expr_17_length_pair_0) 0) (and (=> true (and (>= expr_14_0 0) (<= expr_14_0 1461501637330902918203684832716283019655932542975))) (and (= expr_14_0 called_6_1) (and (= _data_11_2 expr_12_0) (and (=> true (and (>= expr_12_0 0) (<= expr_12_0 115792089237316195423570985008687907853269984665640564039457584007913129639935))) (and (= expr_12_0 data_4_1) (and (and (>= called_6_1 0) (<= called_6_1 1461501637330902918203684832716283019655932542975)) (and (= _data_11_1 0) true))))))))))))))))) true) (block_7_return_function_callwrap__27_28_0 error_2 this_0 abi_0 crypto_0 tx_0 state_0 data_4_0 called_6_0 state_2 data_4_2 called_6_1 _data_11_2))))


(assert
(forall ( (_data_11_0 Int) (_data_11_1 Int) (_data_11_2 Int) (abi_0 |abi_type|) (called_6_0 Int) (called_6_1 Int) (crypto_0 |crypto_type|) (data_4_0 Int) (data_4_1 Int) (data_4_2 Int) (error_0 Int) (error_1 Int) (error_2 Int) (expr_12_0 Int) (expr_14_0 Int) (expr_17_length_pair_0 |bytes_tuple|) (expr_21_0 Int) (expr_22_0 Int) (expr_23_1 Bool) (state_0 |state_type|) (state_1 |state_type|) (state_2 |state_type|) (this_0 Int) (tx_0 |tx_type|))
(=> (and (and (block_7_return_function_callwrap__27_28_0 error_0 this_0 abi_0 crypto_0 tx_0 state_0 data_4_0 called_6_0 state_1 data_4_1 called_6_1 _data_11_1) true) true) (summary_3_function_callwrap__27_28_0 error_0 this_0 abi_0 crypto_0 tx_0 state_0 data_4_0 called_6_0 state_1 data_4_1 called_6_1))))


(declare-fun |block_10_function_callwrap__27_28_0| (Int Int |abi_type| |crypto_type| |tx_type| |state_type| Int Int |state_type| Int Int Int ) Bool)
(assert
(forall ( (_data_11_0 Int) (_data_11_1 Int) (_data_11_2 Int) (abi_0 |abi_type|) (called_6_0 Int) (called_6_1 Int) (crypto_0 |crypto_type|) (data_4_0 Int) (data_4_1 Int) (data_4_2 Int) (error_0 Int) (error_1 Int) (error_2 Int) (expr_12_0 Int) (expr_14_0 Int) (expr_17_length_pair_0 |bytes_tuple|) (expr_21_0 Int) (expr_22_0 Int) (expr_23_1 Bool) (state_0 |state_type|) (state_1 |state_type|) (state_2 |state_type|) (this_0 Int) (tx_0 |tx_type|))
(block_10_function_callwrap__27_28_0 error_0 this_0 abi_0 crypto_0 tx_0 state_0 data_4_0 called_6_0 state_1 data_4_1 called_6_1 _data_11_1)))


(assert
(forall ( (_data_11_0 Int) (_data_11_1 Int) (_data_11_2 Int) (abi_0 |abi_type|) (called_6_0 Int) (called_6_1 Int) (called_6_2 Int) (crypto_0 |crypto_type|) (data_4_0 Int) (data_4_1 Int) (data_4_2 Int) (error_0 Int) (error_1 Int) (error_2 Int) (expr_12_0 Int) (expr_14_0 Int) (expr_17_length_pair_0 |bytes_tuple|) (expr_21_0 Int) (expr_22_0 Int) (expr_23_1 Bool) (funds_2_0 Int) (state_0 |state_type|) (state_1 |state_type|) (state_2 |state_type|) (state_3 |state_type|) (this_0 Int) (tx_0 |tx_type|))
(=> (and (and (block_10_function_callwrap__27_28_0 error_0 this_0 abi_0 crypto_0 tx_0 state_0 data_4_0 called_6_0 state_1 data_4_1 called_6_1 _data_11_1) (and (summary_3_function_callwrap__27_28_0 error_1 this_0 abi_0 crypto_0 tx_0 state_2 data_4_1 called_6_1 state_3 data_4_2 called_6_2) (and (= state_2 (|state_type| (store (|balances| state_1) this_0 (+ (select (|balances| state_1) this_0) funds_2_0)))) (and (and (>= (+ (select (|balances| state_1) this_0) funds_2_0) 0) (<= (+ (select (|balances| state_1) this_0) funds_2_0) 115792089237316195423570985008687907853269984665640564039457584007913129639935)) (and (>= funds_2_0 (|msg.value| tx_0)) (and (and (and (and (and (and (and (and (and (and (and (and (and (> (|block.prevrandao| tx_0) 18446744073709551616) (and (>= (|block.basefee| tx_0) 0) (<= (|block.basefee| tx_0) 115792089237316195423570985008687907853269984665640564039457584007913129639935))) (and (>= (|block.chainid| tx_0) 0) (<= (|block.chainid| tx_0) 115792089237316195423570985008687907853269984665640564039457584007913129639935))) (and (>= (|block.coinbase| tx_0) 0) (<= (|block.coinbase| tx_0) 1461501637330902918203684832716283019655932542975))) (and (>= (|block.prevrandao| tx_0) 0) (<= (|block.prevrandao| tx_0) 115792089237316195423570985008687907853269984665640564039457584007913129639935))) (and (>= (|block.gaslimit| tx_0) 0) (<= (|block.gaslimit| tx_0) 115792089237316195423570985008687907853269984665640564039457584007913129639935))) (and (>= (|block.number| tx_0) 0) (<= (|block.number| tx_0) 115792089237316195423570985008687907853269984665640564039457584007913129639935))) (and (>= (|block.timestamp| tx_0) 0) (<= (|block.timestamp| tx_0) 115792089237316195423570985008687907853269984665640564039457584007913129639935))) (and (>= (|msg.sender| tx_0) 0) (<= (|msg.sender| tx_0) 1461501637330902918203684832716283019655932542975))) (and (>= (|msg.value| tx_0) 0) (<= (|msg.value| tx_0) 115792089237316195423570985008687907853269984665640564039457584007913129639935))) (and (>= (|tx.origin| tx_0) 0) (<= (|tx.origin| tx_0) 1461501637330902918203684832716283019655932542975))) (and (>= (|tx.gasprice| tx_0) 0) (<= (|tx.gasprice| tx_0) 115792089237316195423570985008687907853269984665640564039457584007913129639935))) (and (and (and (and (and (and (= (|msg.value| tx_0) 0) (= (|msg.sig| tx_0) 1450258765)) (= (select (|bytes_tuple_accessor_array| (|msg.data| tx_0)) 0) 86)) (= (select (|bytes_tuple_accessor_array| (|msg.data| tx_0)) 1) 113)) (= (select (|bytes_tuple_accessor_array| (|msg.data| tx_0)) 2) 49)) (= (select (|bytes_tuple_accessor_array| (|msg.data| tx_0)) 3) 77)) (>= (|bytes_tuple_accessor_length| (|msg.data| tx_0)) 4))) (and (and (and (and (= state_1 state_0) (= error_0 0)) (and true (= data_4_1 data_4_0))) (and true (= called_6_1 called_6_0))) true))))))) true) (summary_4_function_callwrap__27_28_0 error_1 this_0 abi_0 crypto_0 tx_0 state_0 data_4_0 called_6_0 state_3 data_4_2 called_6_2))))


(assert
(forall ( (_data_11_0 Int) (_data_11_1 Int) (_data_11_2 Int) (abi_0 |abi_type|) (called_6_0 Int) (called_6_1 Int) (called_6_2 Int) (crypto_0 |crypto_type|) (data_4_0 Int) (data_4_1 Int) (data_4_2 Int) (error_0 Int) (error_1 Int) (error_2 Int) (expr_12_0 Int) (expr_14_0 Int) (expr_17_length_pair_0 |bytes_tuple|) (expr_21_0 Int) (expr_22_0 Int) (expr_23_1 Bool) (funds_2_0 Int) (state_0 |state_type|) (state_1 |state_type|) (state_2 |state_type|) (state_3 |state_type|) (this_0 Int) (tx_0 |tx_type|))
(=> (and (and (interface_0_CallWrapper_28_0 this_0 abi_0 crypto_0 state_0 data_4_0) true) (and (summary_4_function_callwrap__27_28_0 error_0 this_0 abi_0 crypto_0 tx_0 state_0 data_4_0 called_6_0 state_1 data_4_1 called_6_1) (= error_0 0))) (interface_0_CallWrapper_28_0 this_0 abi_0 crypto_0 state_1 data_4_1))))


(declare-fun |contract_initializer_11_CallWrapper_28_0| (Int Int |abi_type| |crypto_type| |tx_type| |state_type| |state_type| Int Int ) Bool)
(declare-fun |contract_initializer_entry_12_CallWrapper_28_0| (Int Int |abi_type| |crypto_type| |tx_type| |state_type| |state_type| Int Int ) Bool)
(assert
(forall ( (_data_11_0 Int) (_data_11_1 Int) (_data_11_2 Int) (abi_0 |abi_type|) (called_6_0 Int) (called_6_1 Int) (called_6_2 Int) (crypto_0 |crypto_type|) (data_4_0 Int) (data_4_1 Int) (data_4_2 Int) (error_0 Int) (error_1 Int) (error_2 Int) (expr_12_0 Int) (expr_14_0 Int) (expr_17_length_pair_0 |bytes_tuple|) (expr_21_0 Int) (expr_22_0 Int) (expr_23_1 Bool) (funds_2_0 Int) (state_0 |state_type|) (state_1 |state_type|) (state_2 |state_type|) (state_3 |state_type|) (this_0 Int) (tx_0 |tx_type|))
(=> (and (and (= state_1 state_0) (= error_0 0)) (and true (= data_4_1 data_4_0))) (contract_initializer_entry_12_CallWrapper_28_0 error_0 this_0 abi_0 crypto_0 tx_0 state_0 state_1 data_4_0 data_4_1))))


(declare-fun |contract_initializer_after_init_13_CallWrapper_28_0| (Int Int |abi_type| |crypto_type| |tx_type| |state_type| |state_type| Int Int ) Bool)
(assert
(forall ( (_data_11_0 Int) (_data_11_1 Int) (_data_11_2 Int) (abi_0 |abi_type|) (called_6_0 Int) (called_6_1 Int) (called_6_2 Int) (crypto_0 |crypto_type|) (data_4_0 Int) (data_4_1 Int) (data_4_2 Int) (error_0 Int) (error_1 Int) (error_2 Int) (expr_12_0 Int) (expr_14_0 Int) (expr_17_length_pair_0 |bytes_tuple|) (expr_21_0 Int) (expr_22_0 Int) (expr_23_1 Bool) (funds_2_0 Int) (state_0 |state_type|) (state_1 |state_type|) (state_2 |state_type|) (state_3 |state_type|) (this_0 Int) (tx_0 |tx_type|))
(=> (and (and (contract_initializer_entry_12_CallWrapper_28_0 error_0 this_0 abi_0 crypto_0 tx_0 state_0 state_1 data_4_0 data_4_1) true) true) (contract_initializer_after_init_13_CallWrapper_28_0 error_0 this_0 abi_0 crypto_0 tx_0 state_0 state_1 data_4_0 data_4_1))))


(assert
(forall ( (_data_11_0 Int) (_data_11_1 Int) (_data_11_2 Int) (abi_0 |abi_type|) (called_6_0 Int) (called_6_1 Int) (called_6_2 Int) (crypto_0 |crypto_type|) (data_4_0 Int) (data_4_1 Int) (data_4_2 Int) (error_0 Int) (error_1 Int) (error_2 Int) (expr_12_0 Int) (expr_14_0 Int) (expr_17_length_pair_0 |bytes_tuple|) (expr_21_0 Int) (expr_22_0 Int) (expr_23_1 Bool) (funds_2_0 Int) (state_0 |state_type|) (state_1 |state_type|) (state_2 |state_type|) (state_3 |state_type|) (this_0 Int) (tx_0 |tx_type|))
(=> (and (and (contract_initializer_after_init_13_CallWrapper_28_0 error_0 this_0 abi_0 crypto_0 tx_0 state_0 state_1 data_4_0 data_4_1) true) true) (contract_initializer_11_CallWrapper_28_0 error_0 this_0 abi_0 crypto_0 tx_0 state_0 state_1 data_4_0 data_4_1))))


(declare-fun |implicit_constructor_entry_14_CallWrapper_28_0| (Int Int |abi_type| |crypto_type| |tx_type| |state_type| |state_type| Int Int ) Bool)
(assert
(forall ( (_data_11_0 Int) (_data_11_1 Int) (_data_11_2 Int) (abi_0 |abi_type|) (called_6_0 Int) (called_6_1 Int) (called_6_2 Int) (crypto_0 |crypto_type|) (data_4_0 Int) (data_4_1 Int) (data_4_2 Int) (error_0 Int) (error_1 Int) (error_2 Int) (expr_12_0 Int) (expr_14_0 Int) (expr_17_length_pair_0 |bytes_tuple|) (expr_21_0 Int) (expr_22_0 Int) (expr_23_1 Bool) (funds_2_0 Int) (state_0 |state_type|) (state_1 |state_type|) (state_2 |state_type|) (state_3 |state_type|) (this_0 Int) (tx_0 |tx_type|))
(=> (and (and (and (and (and (= state_1 state_0) (= error_0 0)) (and true (= data_4_1 data_4_0))) (and true (= data_4_1 0))) true) (>= (select (|balances| state_1) this_0) (|msg.value| tx_0))) (implicit_constructor_entry_14_CallWrapper_28_0 error_0 this_0 abi_0 crypto_0 tx_0 state_0 state_1 data_4_0 data_4_1))))


(assert
(forall ( (_data_11_0 Int) (_data_11_1 Int) (_data_11_2 Int) (abi_0 |abi_type|) (called_6_0 Int) (called_6_1 Int) (called_6_2 Int) (crypto_0 |crypto_type|) (data_4_0 Int) (data_4_1 Int) (data_4_2 Int) (error_0 Int) (error_1 Int) (error_2 Int) (expr_12_0 Int) (expr_14_0 Int) (expr_17_length_pair_0 |bytes_tuple|) (expr_21_0 Int) (expr_22_0 Int) (expr_23_1 Bool) (funds_2_0 Int) (state_0 |state_type|) (state_1 |state_type|) (state_2 |state_type|) (state_3 |state_type|) (this_0 Int) (tx_0 |tx_type|))
(=> (and (and (implicit_constructor_entry_14_CallWrapper_28_0 error_0 this_0 abi_0 crypto_0 tx_0 state_0 state_1 data_4_0 data_4_1) (and (contract_initializer_11_CallWrapper_28_0 error_1 this_0 abi_0 crypto_0 tx_0 state_1 state_2 data_4_1 data_4_2) true)) (> error_1 0)) (summary_constructor_2_CallWrapper_28_0 error_1 this_0 abi_0 crypto_0 tx_0 state_0 state_2 data_4_0 data_4_2))))


(assert
(forall ( (_data_11_0 Int) (_data_11_1 Int) (_data_11_2 Int) (abi_0 |abi_type|) (called_6_0 Int) (called_6_1 Int) (called_6_2 Int) (crypto_0 |crypto_type|) (data_4_0 Int) (data_4_1 Int) (data_4_2 Int) (error_0 Int) (error_1 Int) (error_2 Int) (expr_12_0 Int) (expr_14_0 Int) (expr_17_length_pair_0 |bytes_tuple|) (expr_21_0 Int) (expr_22_0 Int) (expr_23_1 Bool) (funds_2_0 Int) (state_0 |state_type|) (state_1 |state_type|) (state_2 |state_type|) (state_3 |state_type|) (this_0 Int) (tx_0 |tx_type|))
(=> (and (and (implicit_constructor_entry_14_CallWrapper_28_0 error_0 this_0 abi_0 crypto_0 tx_0 state_0 state_1 data_4_0 data_4_1) (and (= error_1 0) (and (contract_initializer_11_CallWrapper_28_0 error_1 this_0 abi_0 crypto_0 tx_0 state_1 state_2 data_4_1 data_4_2) true))) true) (summary_constructor_2_CallWrapper_28_0 error_1 this_0 abi_0 crypto_0 tx_0 state_0 state_2 data_4_0 data_4_2))))


(assert
(forall ( (_data_11_0 Int) (_data_11_1 Int) (_data_11_2 Int) (abi_0 |abi_type|) (called_6_0 Int) (called_6_1 Int) (called_6_2 Int) (crypto_0 |crypto_type|) (data_4_0 Int) (data_4_1 Int) (data_4_2 Int) (error_0 Int) (error_1 Int) (error_2 Int) (expr_12_0 Int) (expr_14_0 Int) (expr_17_length_pair_0 |bytes_tuple|) (expr_21_0 Int) (expr_22_0 Int) (expr_23_1 Bool) (funds_2_0 Int) (state_0 |state_type|) (state_1 |state_type|) (state_2 |state_type|) (state_3 |state_type|) (this_0 Int) (tx_0 |tx_type|))
(=> (and (and (summary_constructor_2_CallWrapper_28_0 error_0 this_0 abi_0 crypto_0 tx_0 state_0 state_1 data_4_0 data_4_1) true) (and (and (and (and (and (and (and (and (and (and (and (and (and (> (|block.prevrandao| tx_0) 18446744073709551616) (and (>= (|block.basefee| tx_0) 0) (<= (|block.basefee| tx_0) 115792089237316195423570985008687907853269984665640564039457584007913129639935))) (and (>= (|block.chainid| tx_0) 0) (<= (|block.chainid| tx_0) 115792089237316195423570985008687907853269984665640564039457584007913129639935))) (and (>= (|block.coinbase| tx_0) 0) (<= (|block.coinbase| tx_0) 1461501637330902918203684832716283019655932542975))) (and (>= (|block.prevrandao| tx_0) 0) (<= (|block.prevrandao| tx_0) 115792089237316195423570985008687907853269984665640564039457584007913129639935))) (and (>= (|block.gaslimit| tx_0) 0) (<= (|block.gaslimit| tx_0) 115792089237316195423570985008687907853269984665640564039457584007913129639935))) (and (>= (|block.number| tx_0) 0) (<= (|block.number| tx_0) 115792089237316195423570985008687907853269984665640564039457584007913129639935))) (and (>= (|block.timestamp| tx_0) 0) (<= (|block.timestamp| tx_0) 115792089237316195423570985008687907853269984665640564039457584007913129639935))) (and (>= (|msg.sender| tx_0) 0) (<= (|msg.sender| tx_0) 1461501637330902918203684832716283019655932542975))) (and (>= (|msg.value| tx_0) 0) (<= (|msg.value| tx_0) 115792089237316195423570985008687907853269984665640564039457584007913129639935))) (and (>= (|tx.origin| tx_0) 0) (<= (|tx.origin| tx_0) 1461501637330902918203684832716283019655932542975))) (and (>= (|tx.gasprice| tx_0) 0) (<= (|tx.gasprice| tx_0) 115792089237316195423570985008687907853269984665640564039457584007913129639935))) (= (|msg.value| tx_0) 0)) (= error_0 0))) (interface_0_CallWrapper_28_0 this_0 abi_0 crypto_0 state_1 data_4_1))))


(declare-fun |error_target_3_0| () Bool)
(assert
(forall ( (_data_11_0 Int) (_data_11_1 Int) (_data_11_2 Int) (abi_0 |abi_type|) (called_6_0 Int) (called_6_1 Int) (called_6_2 Int) (crypto_0 |crypto_type|) (data_4_0 Int) (data_4_1 Int) (data_4_2 Int) (error_0 Int) (error_1 Int) (error_2 Int) (expr_12_0 Int) (expr_14_0 Int) (expr_17_length_pair_0 |bytes_tuple|) (expr_21_0 Int) (expr_22_0 Int) (expr_23_1 Bool) (funds_2_0 Int) (state_0 |state_type|) (state_1 |state_type|) (state_2 |state_type|) (state_3 |state_type|) (this_0 Int) (tx_0 |tx_type|))
(=> (and (and (interface_0_CallWrapper_28_0 this_0 abi_0 crypto_0 state_0 data_4_0) true) (and (summary_4_function_callwrap__27_28_0 error_0 this_0 abi_0 crypto_0 tx_0 state_0 data_4_0 called_6_0 state_1 data_4_1 called_6_1) (= error_0 1))) error_target_3_0)))



(assert
(forall ( (_data_11_0 Int) (_data_11_1 Int) (_data_11_2 Int) (abi_0 |abi_type|) (called_6_0 Int) (called_6_1 Int) (called_6_2 Int) (crypto_0 |crypto_type|) (data_4_0 Int) (data_4_1 Int) (data_4_2 Int) (error_0 Int) (error_1 Int) (error_2 Int) (expr_12_0 Int) (expr_14_0 Int) (expr_17_length_pair_0 |bytes_tuple|) (expr_21_0 Int) (expr_22_0 Int) (expr_23_1 Bool) (funds_2_0 Int) (state_0 |state_type|) (state_1 |state_type|) (state_2 |state_type|) (state_3 |state_type|) (this_0 Int) (tx_0 |tx_type|))
(=> error_target_3_0 false)))
(check-sat)
