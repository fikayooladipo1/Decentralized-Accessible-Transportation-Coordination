;; Rider Verification Contract
;; Manages user accessibility requirements

(define-data-var last-id uint u0)

(define-map riders
  { id: uint }
  {
    user: principal,
    needs: (string-ascii 100),
    wheelchair: bool
  }
)

;; Register as rider
(define-public (register
    (needs (string-ascii 100))
    (wheelchair bool)
  )
  (let
    (
      (new-id (+ (var-get last-id) u1))
    )
    (var-set last-id new-id)

    (map-set riders
      { id: new-id }
      {
        user: tx-sender,
        needs: needs,
        wheelchair: wheelchair
      }
    )

    (ok new-id)
  )
)

;; Get rider
(define-read-only (get-rider (id uint))
  (map-get? riders { id: id })
)
