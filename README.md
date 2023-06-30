# CoinFlip Solidity Kontratı

Bu Solidity kontratı, bir yazı-tura oyununu taklit eder ve kullanıcıların bahis yapmasını sağlar.

## Nasıl Çalışır?

1. `Outcome` adında bir `enum` tanımlanır. Bu, olası sonuçları (`Yazı`, `Tura`) içerir.

2. `Bet` adında bir `struct` tanımlanır. Bu, bahis detaylarını tutar ve aşağıdaki alanlardan oluşur:
   - `bettor`: Bahsi yapan kişinin adresi
   - `amount`: Bahis miktarı
   - `choice`: Bahis tercihi (Yazı mı, Tura mı?)

3. `bets` adında bir dinamik dizi tanımlanır. Bu dizi, yapılan bahisleri saklar.

4. `totalBetAmount` adında bir değişken tanımlanır. Bu değişken, toplam bahis miktarını tutar.

5. `placeBet` fonksiyonu, kullanıcıların bahis yapmasını sağlar. Aşağıdaki parametreleri alır:
   - `choice`: Bahis tercihi (Yazı mı, Tura mı?)
   Fonksiyon, bahis yapılacak adresi, bahis miktarını ve tercihi içeren bir `Bet` yapısı oluşturur. Bu bahisi `bets` dizisine ekler ve `totalBetAmount` değişkenini günceller.

6. `resolveBet` fonksiyonu, bahisleri sonlandırır ve kazananları belirler. Fonksiyon aşağıdaki adımları içerir:
   - Rastgele bir sonuç oluşturulur. Bu, yazı-tura sonucunu taklit eder.
   - Kazanan taraftaki bahis miktarı hesaplanır.
   - Kazançlar, orantılı bir şekilde bahis yapanlara dağıtılır.
   - Sonraki bahis turu için `bets` dizisi ve `totalBetAmount` sıfırlanır.

## Kullanım

1. `placeBet` fonksiyonunu kullanarak bahis yapabilirsiniz. Bahis yaparken tercih ettiğiniz sonucu (`Yazı` veya `Tura`) belirtmelisiniz. Bahis yaparken Ethereum ile bahis miktarını göndermelisiniz.

2. Bahisler sonlandığında `resolveBet` fonksiyonunu çağırarak kazananları belirleyebilirsiniz. Fonksiyon, kazanan taraftaki bahis miktarına göre kazançları dağıtır.
