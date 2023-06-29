## EIP-1967 Standard Proxy Storage Slot (번역_한글)
- 출처 : https://ethereum-blockchain-developer.com/110-upgrade-smart-contracts/09-eip-1967/

이 EIP는 프록시가 로직 컨트랙트 주소를 저장하는 방법을 표준화합니다. 이를 통해 블록 탐색기와 같은 외부 서비스에서 최종 사용자에게 정확한 정보를 더 쉽게 표시할 수 있습니다. 이더스캔은 [2019년 말에 이에 대한 지원을 추가](https://medium.com/etherscan-blog/and-finally-proxy-contract-support-on-etherscan-693e3da0714b)했습니다. 또한 EIP-1967은 전체 패턴에 몇 가지 기믹을 더 추가했습니다!

주요 기능은 무엇인가요? 당연히 스토리지 슬롯입니다. EIP-1822에서는 keccak256("PROXIABLE") 또는 실제로 원하는 대로 지정할 수 있었지만, EIP-1967에서는 잘 정의되어 있습니다

Storage slot `0x360894a13ba1a3210667c828492db98dca3e2076cc3735a920a3ca505d382bbc`(구체적으로 `bytes32(uint256(keccak256('eip1967.proxy.implementation')) - 1)`)는 로직 컨트랙트를 위해 예약되어 있습니다.

그러나 EIP-1967은 실제 관리자 기능을 위한 비콘 컨트랙트와 스토리지도 추가합니다.

### 비콘 컨트랙트 

비콘 컨트랙트의 핵심은 재사용성입니다. 동일한 로직 컨트랙트 주소를 가리키는 프록시가 여러 개 있다면, 로직 컨트랙트를 업데이트할 때마다 모든 프록시를 업데이트해야 할 것입니다. 이는 가스를 많이 소모할 수 있으므로 모든 프록시에 대한 로직 컨트랙트의 주소를 반환하는 비콘 컨트랙트를 사용하는 것이 더 합리적일 수 있습니다.

따라서 비콘을 사용하는 경우, 실제 로직 컨트랙트의 주소를 반환하는 또 다른 스마트 컨트랙트 레이어가 중간에 존재하게 됩니다.

정말 좋은 샘플 구현은 [오픈제플린의 리포지토리](https://github.com/OpenZeppelin/openzeppelin-sdk/blob/dc9e4edf1169eb8bd675961c9d821d1a712a70df/packages/lib/contracts/upgradeability/BaseAdminUpgradeabilityProxy.sol)에서 사용됩니다.

이는 네임스페이스가 명확하게 정의되어 있을 뿐 기본적으로 EIP-1822와 동일한 기능이므로, 이 시점에서는 이전 설명에서 했던 예제를 참조하겠습니다.

이전과 같은 실험을 반복하는 대신 다른 패턴에 대해 이야기하고 싶습니다: 다이아몬드 저장 패턴입니다.