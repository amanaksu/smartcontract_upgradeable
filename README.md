# smartcontract_upgradeable
Upgradeable SmartContract Example Code

하기의 사이트를 참고해 내용을 정리하고 샘플 코드를 작성합니다. 

출처 : https://ethereum-blockchain-developer.com/110-upgrade-smart-contracts/00-project/

---

### 표준 업그레이드 가능한 스마트 컨트랙트

1. Eternal Storage Pattern ([원문_영문](https://github.com/OpenZeppelin/openzeppelin-labs/tree/master/upgradeability_using_eternal_storage), [번역_한글](./docs/upgradeability_using_eternal_storage.md))
    - 제안자 : Elena Dimitrova ([blog 원문_영문](https://blog.colony.io/writing-upgradeable-contracts-in-solidity-6743f0eecc88/))
    - 최초 자신의 블로그에 아이디어를 게시함
    - 상세설명 : [eternal storage without proxy (번역_한글)](./docs/eternal_storage_without_proxy.md)
    
2. Upgradeable.sol ([코드](https://gist.github.com/Arachnid/4ca9da48d51e23e5cfe0f0e14dd6318f))
    - 제안자 : Nick Johnson (ENS & 이더리움 재단 리드 개발자)
    - Nick Jonhnson 이 제안 방식에서 확장되기 시작함
    - 상세설명 : [first_proxy (번역_한글)](./docs/first_proxy.md)
3. EIP-897 : DelegateProxy ([원문_영문](https://eips.ethereum.org/EIPS/eip-897), [번역_한글](./docs/erc_897_delegateProxy.md))
    - 생성일 : 2018-02-21
    - 제안자 : Jorge Izquierdo, Manuel Araoz
    - 상세설명 : [ERC-897 Proxy (번역_한글)](./docs/erc_897_proxy.md)
4. EIP-1822 : Universal Upgradeable Proxy Standard (UUPS) ([원문_영문](https://eips.ethereum.org/EIPS/eip-1822))
    - 생성일 : 2019-03-04
    - 제안자 : Gabriel Barros, Patrick Gallagher
    - 상세설명 : [EIP-1822 UUPS (번역_한글)](./docs/eip_1822_proxies_without_storage_collision_without_common_storage_contracts.md)
5. EIP-1967 : Standard Proxy Storage Slots ([원문_영문](https://eips.ethereum.org/EIPS/eip-1967))
    - 생성일 : 2019-04-24
    - 제안자 : Santiago Palladino
6. EIP-1538 : Transparent Contract Standard ([원문_영문](https://eips.ethereum.org/EIPS/eip-1538))
    - 생성일 : 2018-10-31
    - 제안자 : Nick Mudge
7. EIP-2535 : Diamond Standard ([원문_영문](https://eips.ethereum.org/EIPS/eip-2535))
    - 생성일 : 2020-02-22
    - 제안자 : Nick Mudge
8. EIP-1014 : CREATE2 ([원문_영문](https://eips.ethereum.org/EIPS/eip-1014))
    - 생성일 : 2018-04-20
    - 제안자 : Vitalik Buterin