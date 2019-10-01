module Deposits
  class Bank < ::Deposit
    include ::AasmAbsolutely
    include ::Deposits::Bankable
    include ::FundSourceable

    def charge!(txid)
      with_lock if
        submit!
        accept!
        touch(:done_at)
        update_attribute(:txid, txid)
      end
    end

  end
end
