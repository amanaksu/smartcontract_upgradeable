## EIP-1538 : Transparent Contract Standard (번역_한글)
- 출처 : https://ethereum-blockchain-developer.com/110-upgrade-smart-contracts/10-eip-1538-transparent-contract-standard/

이제부터 EIP-1538 : Transparent Contract Standard([원문](https://eips.ethereum.org/EIPS/eip-1538)) 와 EIP-2535 : Diamond Standard([원문](https://eips.ethereum.org/EIPS/eip-2535)) 에 대해 이야기해 보겠습니다. EIP-2535은 EIP-1538를 대체하는 것으로 두가지 모두 Nick Mudge가 만들었습니다. 그래서 EIP-1538의 아이디어만 간략히 설명하겠습니다. 

첫번째 구현은 로직 컨트랙트 전체를 정의하는 대신, 기본적인 로직 컨트랙트 기능만을 추출하고 주소를 설정합니다. 이렇게 하면, 원하는 만큼의 로직 컨트랙트를 가질 수 있고, 점진적으로 함수를 업데이트할 수 있습니다. 샘플 구현은 [Repository](https://github.com/mudgen/transparent-contracts-erc1538/tree/master/contracts)에서 확인할 수 있습니다. 

동작에 대해 설명하겠지만, EIP-1538은 EIP-2535로 대체되기 때문에 세부적으로 설명하진 않겠습니다. 

[테스트 샘플](https://github.com/mudgen/transparent-contracts-erc1538/blob/master/test/tests.js)을 살펴보면, deleagatecall 을 처리하는 fallback 함수를 갖는 MyTransparentContract 를 중심으로 이뤄집니다. 이 함수는 함수 서명(4bytes)을 주소로 매핑하는 기능을 갖는 ERC1538Delegate 주소를 가져옵니다. 

이후, MyTransparentContract fallback 함수는 함수 서명이 어떤 주소에서 실행될지 결정해 MyTransparentContract에서 `delegatecall`을 호출합니다.  

예를 들어, ERC20 토큰의 경우, ERC20 주소에서 실행되는 모든 함수 서명을 제공하고, ERC1538Delegate 에서 사용되는 로직인 MyTransaparentContracts의 `updateContract`를 통해 이를 매핑에 추가해야 합니다. 

이해하기에는 복잡하지만, 적어도 제 생각에는, 컨트랙트 최대 크기 제한인 24KB 를 우회할 수 있다는 점만은 해결됩니다. 

제가 틀렸을 수 있지만, 기능을 업그레이드하려면, 먼저 전체 컨트랙트를 배포해야 하기 때문에, 기능을 원자단위로 추가하여 가스를 절약할 수 있지는 않는 것으로 생각됩니다. 가상함수를 제공해 이 문제를 어느 정도 [해결](https://github.com/ethereum/EIPs/issues/1538#issuecomment-451985155)할 수 있다는 것은 이해하지만, 원자적 업데이트로 간주하기에는 충분하지 않습니다. 예를 들어, 발행 가능한 ERC20 컨트랙트를 배포하고 발행 함수를 어떻게든 변경하려는 경우, 새로운 발행 함수를 포함하여 발행 함수가 의존하는 모든 함수와 함께 전체 ERC20 컨트랙트를 다시 배포해야 변경할 수 있습니다. 

하지만, Nick Mudge 는 더 나은 해결책을 생각해 냈습니다. 