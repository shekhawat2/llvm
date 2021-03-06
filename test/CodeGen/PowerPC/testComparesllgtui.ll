; RUN: llc -verify-machineinstrs -mtriple=powerpc64-unknown-linux-gnu -O2 \
; RUN:   -ppc-gpr-icmps=all -ppc-asm-full-reg-names -mcpu=pwr8 < %s | FileCheck %s \
; RUN:  --implicit-check-not cmpw --implicit-check-not cmpd --implicit-check-not cmpl
; RUN: llc -verify-machineinstrs -mtriple=powerpc64le-unknown-linux-gnu -O2 \
; RUN:   -ppc-gpr-icmps=all -ppc-asm-full-reg-names -mcpu=pwr8 < %s | FileCheck %s \
; RUN:  --implicit-check-not cmpw --implicit-check-not cmpd --implicit-check-not cmpl

@glob = common local_unnamed_addr global i32 0, align 4

; Function Attrs: norecurse nounwind readnone
define i64 @test_llgtui(i32 zeroext %a, i32 zeroext %b) {
; CHECK-LABEL: test_llgtui:
; CHECK-NOT:     clrldi
; CHECK:    sub [[REG:r[0-9]+]], r4, r3
; CHECK-NEXT:    rldicl r3, [[REG]], 1, 63
entry:
  %cmp = icmp ugt i32 %a, %b
  %conv1 = zext i1 %cmp to i64
  ret i64 %conv1
}

; Function Attrs: norecurse nounwind readnone
define i64 @test_llgtui_sext(i32 zeroext %a, i32 zeroext %b) {
; CHECK-LABEL: test_llgtui_sext:
; CHECK:    sub [[REG:r[0-9]+]], r4, r3
; CHECK-NEXT:    sradi r3, [[REG]], 63
; CHECK-NEXT:    blr
entry:
  %cmp = icmp ugt i32 %a, %b
  %conv1 = sext i1 %cmp to i64
  ret i64 %conv1
}

; Function Attrs: norecurse nounwind readnone
define i64 @test_llgtui_z(i32 zeroext %a) {
; CHECK-LABEL: test_llgtui_z:
; CHECK:    cntlzw r3, r3
; CHECK-NEXT:    srwi r3, r3, 5
; CHECK-NEXT:    xori r3, r3, 1
; CHECK-NEXT:    blr
entry:
  %cmp = icmp ne i32 %a, 0
  %conv1 = zext i1 %cmp to i64
  ret i64 %conv1
}

; Function Attrs: norecurse nounwind readnone
define i64 @test_llgtui_sext_z(i32 zeroext %a) {
; CHECK-LABEL: test_llgtui_sext_z:
; CHECK:    cntlzw r3, r3
; CHECK-NEXT:    srwi r3, r3, 5
; CHECK-NEXT:    xori r3, r3, 1
; CHECK-NEXT:    neg r3, r3
; CHECK-NEXT:    blr
entry:
  %cmp = icmp ne i32 %a, 0
  %conv1 = sext i1 %cmp to i64
  ret i64 %conv1
}

; Function Attrs: norecurse nounwind
define void @test_llgtui_store(i32 zeroext %a, i32 zeroext %b) {
; CHECK-LABEL: test_llgtui_store:
; CHECK:         sub [[REG:r[0-9]+]], r4, r3
; CHECK:         rldicl {{r[0-9]+}}, [[REG]], 1, 63
entry:
  %cmp = icmp ugt i32 %a, %b
  %conv = zext i1 %cmp to i32
  store i32 %conv, i32* @glob, align 4
  ret void
}

; Function Attrs: norecurse nounwind
define void @test_llgtui_sext_store(i32 zeroext %a, i32 zeroext %b) {
; CHECK-LABEL: test_llgtui_sext_store:
; CHECK:         sub [[REG:r[0-9]+]], r4, r3
; CHECK:         sradi {{r[0-9]+}}, [[REG]], 63
entry:
  %cmp = icmp ugt i32 %a, %b
  %sub = sext i1 %cmp to i32
  store i32 %sub, i32* @glob, align 4
  ret void
}

; Function Attrs: norecurse nounwind
define void @test_llgtui_z_store(i32 zeroext %a) {
; CHECK-LABEL: test_llgtui_z_store:
; CHECK:    cntlzw r3, r3
; CHECK:    srwi r3, r3, 5
; CHECK:    xori r3, r3, 1
; CHECK:    stw r3, 0(r4)
; CHECK-NEXT:    blr
entry:
  %cmp = icmp ne i32 %a, 0
  %conv = zext i1 %cmp to i32
  store i32 %conv, i32* @glob, align 4
  ret void
}

; Function Attrs: norecurse nounwind
define void @test_llgtui_sext_z_store(i32 zeroext %a) {
; CHECK-LABEL: test_llgtui_sext_z_store:
; CHECK:    cntlzw r3, r3
; CHECK:    srwi r3, r3, 5
; CHECK:    xori r3, r3, 1
; CHECK:    neg r3, r3
; CHECK:    stw r3, 0(r4)
; CHECK-NEXT:    blr
entry:
  %cmp = icmp ne i32 %a, 0
  %sub = sext i1 %cmp to i32
  store i32 %sub, i32* @glob, align 4
  ret void
}
