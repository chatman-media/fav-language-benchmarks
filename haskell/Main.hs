{-# LANGUAGE OverloadedStrings #-}

import Web.Scotty
import Data.Aeson (object, (.=), Value, (.:))
import qualified Data.Aeson as A
import Data.Text.Lazy (Text)
import Control.Monad.IO.Class (liftIO)

main :: IO ()
main = scotty 3000 $ do
  post "/json" $ do
    body <- jsonData :: ActionM A.Object
    let msg = maybe "" id (A.parseMaybe (.: "message") body)
        num = maybe 0  id (A.parseMaybe (.: "number") body)
    json $ object [ "message" .= ("world" :: Text)
                  , "number"  .= (num + 1 :: Int)
                  ]