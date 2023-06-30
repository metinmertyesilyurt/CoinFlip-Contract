// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CoinFlip {
    enum Outcome { Heads, Tails }

    struct Bet {
        address payable bettor;
        uint256 amount;
        Outcome choice;
    }

    Bet[] public bets;
    uint256 public totalBetAmount = 0;

    function placeBet(Outcome choice) public payable {
        require(msg.value > 0, "Must bet more than 0");
        
        Bet memory newBet = Bet({
            bettor: payable(msg.sender),
            amount: msg.value,
            choice: choice
        });

        bets.push(newBet);
        totalBetAmount += msg.value;
    }

    function resolveBet() public {
        require(bets.length > 0, "No bets to resolve");

        // Emulate coin flip.
        Outcome result = (block.timestamp % 2 == 0) ? Outcome.Heads : Outcome.Tails;
        
        // Calculate total amount bet on the winning side.
        uint256 winningAmount = 0;
        for (uint i = 0; i < bets.length; i++) {
            if (bets[i].choice == result) {
                winningAmount += bets[i].amount;
            }
        }

        // Distribute winnings proportionally.
        for (uint i = 0; i < bets.length; i++) {
            if (bets[i].choice == result) {
                uint256 payout = (bets[i].amount / winningAmount) * totalBetAmount;
                bets[i].bettor.transfer(payout);
            }
        }

        // Reset for next round of betting.
        delete bets;
        totalBetAmount = 0;
    }
}
