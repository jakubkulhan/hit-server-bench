{-# LANGUAGE OverloadedStrings #-}

import Network.Wai
import Network.HTTP.Types (status200)
import Network.Wai.Handler.Warp (run)

import qualified Data.ByteString.Lazy.Char8 as LB8
import Data.UnixTime (getUnixTime, utSeconds)

application2 :: Application
application2 _ respond = do
  time <- getUnixTime
  let seconds = utSeconds time
  respond $ responseLBS status200 [("Content-Type", "text/plain")] $ LB8.pack (show seconds)

main :: IO ()
main = run 8080 application2
