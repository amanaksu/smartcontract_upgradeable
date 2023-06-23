## ERC-897
- 출처 : https://eips.ethereum.org/EIPS/eip-897

## 차례
- [요약](#요약)
- [초록](#초록)
- [구현](#구현)
- [표준 인터페이스](#표준-인터페이스)
    - 코드 주소 (implementation())
    - 프록시 타입 (proxyType())
- [장점](#장점)
- [저작권](#저작권)

### 요약 
프록시 컨트랙트는 특정 컨트랙트의 많은 인스턴스를 배포하 때 업그레이드 가능 매커니즘과 가스를 절약하는 방법으로 점점 더 많이 사용되고 있다. 이 표준은 프록시의 작동 방식과 주요 구현을 알리기 위한 일련의 인터페이스를 제안합니다. 

### 초록
자체 로직을 다른 컨트랙트에 위임하는 프록시를 사용하는 것은 스마트 컨트랙트 업그레이드와 저렴한 클론 컨트랙트 생성을 위해 점점 더 인기 있는 기술이 되고 있습니다.

저희는 단순성을 고려할 때 DelegateProxy의 특정 구현을 표준화할 가치가 없다고 생각하지만, 모든 프록시가 사용하는 인터페이스에 합의하여 프록시 작동의 표준 방식을 마련하는 것은 많은 가치가 있다고 생각합니다.


### 구현
- aragonOS : [AppProxyUpgeadeable](https://github.com/aragon/aragonOS/blob/master/contracts/apps/AppProxyUpgradeable.sol), [AppProxyPinned](https://github.com/aragon/aragonOS/blob/master/contracts/apps/AppProxyPinned.sol), [KernelProxy](https://github.com/aragon/aragonOS/blob/master/contracts/kernel/KernelProxy.sol)
- zeppelinOS : [Proxy](https://github.com/OpenZeppelin/openzeppelin-labs/blob/2da9e859db81a61f2449d188e7193788ca721c65/upgradeability_ownership/contracts/Proxy.sol)


### 표준 인터페이스
```solidity
interface ERCProxy {
    function proxyType() public pure returns (uint256 proxyTypeId);
    function implementation() public view returns (address codeAddr);
}
```

#### Proxy Type (proxyType())
반환된 코드 주소는 해당 메시지에 대해 프록시가 해당 시점에 호출을 위임할 주소입니다. 

#### Code Address (implementation())
프록시 유형을 확인하는 것은 컨트랙트가 프록시인지 여부를 확인하는 방법입니다. 컨트랙트가 이 메서드로 반환하지 않거나 0을 반환하면, 해당 컨트랙트는 프록시가 아닌 것으로 간주할 수 있습니다.

또한 프록시가 어떻게 작동하는지에 대한 정보를 조금 더 전달할 수 있습니다. 이는 순수 함수이므로 상태 변화에 따라 다른 값을 반환할 수 없으므로 사실상 상수입니다.
- Forwarding proxy (id = 1) : 프록시는 항상 동일한 코드 주소로 전달합니다. 프록시가 0이 아닌 코드 주소를 반환하면 해당 코드 주소는 절대 변경되지 않아야 한다는 다음 불변성이 항상 참이어야 합니다.
- Upgradeable proxy (id = 2) : 프록시 코드 주소는 프록시 수준 또는 전달 로직에 구현된 임의의 로직에 따라 변경될 수 있습니다.

### 장점
- 소스코드 검증 : 현재 이더스캔과 같은 탐색기에서 프록시 코드를 확인할 때 프록시 자체의 코드만 표시되고 컨트랙트의 실제 코드는 표시되지 않습니다. 이 구조를 표준화하면 실제 ABI와 컨트랙트의 코드를 모두 표시할 수 있게 됩니다.


### 저작권
[CC0](https://eips.ethereum.org/LICENSE)를 통해 저작권 및 관련 권리가 면제됩니다.
