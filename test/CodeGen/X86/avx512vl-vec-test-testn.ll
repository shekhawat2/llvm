; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=x86_64-unknown-unknown -mattr=+avx512vl | FileCheck %s --check-prefix=X86_64
; RUN: llc < %s -mtriple=i386-unknown-unknown -mattr=+avx512vl | FileCheck %s --check-prefix=I386

; Function Attrs: norecurse nounwind readnone
define zeroext i8 @TEST_mm_test_epi64_mask(<2 x i64> %__A, <2 x i64> %__B) local_unnamed_addr #0 {
; X86_64-LABEL: TEST_mm_test_epi64_mask:
; X86_64:       # %bb.0: # %entry
; X86_64-NEXT:    vptestmq %xmm0, %xmm1, %k0
; X86_64-NEXT:    kmovw %k0, %eax
; X86_64-NEXT:    # kill: def $al killed $al killed $eax
; X86_64-NEXT:    retq
;
; I386-LABEL: TEST_mm_test_epi64_mask:
; I386:       # %bb.0: # %entry
; I386-NEXT:    vptestmq %xmm0, %xmm1, %k0
; I386-NEXT:    kmovw %k0, %eax
; I386-NEXT:    # kill: def $al killed $al killed $eax
; I386-NEXT:    retl
entry:
  %and.i.i = and <2 x i64> %__B, %__A
  %0 = icmp ne <2 x i64> %and.i.i, zeroinitializer
  %1 = shufflevector <2 x i1> %0, <2 x i1> zeroinitializer, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 2, i32 3, i32 2, i32 3>
  %2 = bitcast <8 x i1> %1 to i8
  ret i8 %2
}

; Function Attrs: norecurse nounwind readnone
define zeroext i8 @TEST_mm_test_epi32_mask(<2 x i64> %__A, <2 x i64> %__B) local_unnamed_addr #0 {
; X86_64-LABEL: TEST_mm_test_epi32_mask:
; X86_64:       # %bb.0: # %entry
; X86_64-NEXT:    vptestmd %xmm0, %xmm1, %k0
; X86_64-NEXT:    kmovw %k0, %eax
; X86_64-NEXT:    # kill: def $al killed $al killed $eax
; X86_64-NEXT:    retq
;
; I386-LABEL: TEST_mm_test_epi32_mask:
; I386:       # %bb.0: # %entry
; I386-NEXT:    vptestmd %xmm0, %xmm1, %k0
; I386-NEXT:    kmovw %k0, %eax
; I386-NEXT:    # kill: def $al killed $al killed $eax
; I386-NEXT:    retl
entry:
  %and.i.i = and <2 x i64> %__B, %__A
  %0 = bitcast <2 x i64> %and.i.i to <4 x i32>
  %1 = icmp ne <4 x i32> %0, zeroinitializer
  %2 = shufflevector <4 x i1> %1, <4 x i1> zeroinitializer, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %3 = bitcast <8 x i1> %2 to i8
  ret i8 %3
}

; Function Attrs: norecurse nounwind readnone
define zeroext i8 @TEST_mm256_test_epi64_mask(<4 x i64> %__A, <4 x i64> %__B) local_unnamed_addr #0 {
; X86_64-LABEL: TEST_mm256_test_epi64_mask:
; X86_64:       # %bb.0: # %entry
; X86_64-NEXT:    vptestmq %ymm0, %ymm1, %k0
; X86_64-NEXT:    kmovw %k0, %eax
; X86_64-NEXT:    # kill: def $al killed $al killed $eax
; X86_64-NEXT:    vzeroupper
; X86_64-NEXT:    retq
;
; I386-LABEL: TEST_mm256_test_epi64_mask:
; I386:       # %bb.0: # %entry
; I386-NEXT:    vptestmq %ymm0, %ymm1, %k0
; I386-NEXT:    kmovw %k0, %eax
; I386-NEXT:    # kill: def $al killed $al killed $eax
; I386-NEXT:    vzeroupper
; I386-NEXT:    retl
entry:
  %and.i.i = and <4 x i64> %__B, %__A
  %0 = icmp ne <4 x i64> %and.i.i, zeroinitializer
  %1 = shufflevector <4 x i1> %0, <4 x i1> zeroinitializer, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %2 = bitcast <8 x i1> %1 to i8
  ret i8 %2
}

; Function Attrs: norecurse nounwind readnone
define zeroext i8 @TEST_mm256_test_epi32_mask(<4 x i64> %__A, <4 x i64> %__B) local_unnamed_addr #0 {
; X86_64-LABEL: TEST_mm256_test_epi32_mask:
; X86_64:       # %bb.0: # %entry
; X86_64-NEXT:    vptestmd %ymm0, %ymm1, %k0
; X86_64-NEXT:    kmovw %k0, %eax
; X86_64-NEXT:    # kill: def $al killed $al killed $eax
; X86_64-NEXT:    vzeroupper
; X86_64-NEXT:    retq
;
; I386-LABEL: TEST_mm256_test_epi32_mask:
; I386:       # %bb.0: # %entry
; I386-NEXT:    vptestmd %ymm0, %ymm1, %k0
; I386-NEXT:    kmovw %k0, %eax
; I386-NEXT:    # kill: def $al killed $al killed $eax
; I386-NEXT:    vzeroupper
; I386-NEXT:    retl
entry:
  %and.i.i = and <4 x i64> %__B, %__A
  %0 = bitcast <4 x i64> %and.i.i to <8 x i32>
  %1 = icmp ne <8 x i32> %0, zeroinitializer
  %2 = bitcast <8 x i1> %1 to i8
  ret i8 %2
}

; Function Attrs: norecurse nounwind readnone
define zeroext i8 @TEST_mm_mask_test_epi64_mask(i8 %__U, <2 x i64> %__A, <2 x i64> %__B) local_unnamed_addr #0 {
; X86_64-LABEL: TEST_mm_mask_test_epi64_mask:
; X86_64:       # %bb.0: # %entry
; X86_64-NEXT:    kmovw %edi, %k1
; X86_64-NEXT:    vptestmq %xmm0, %xmm1, %k0 {%k1}
; X86_64-NEXT:    kmovw %k0, %eax
; X86_64-NEXT:    # kill: def $al killed $al killed $eax
; X86_64-NEXT:    retq
;
; I386-LABEL: TEST_mm_mask_test_epi64_mask:
; I386:       # %bb.0: # %entry
; I386-NEXT:    movzbl {{[0-9]+}}(%esp), %eax
; I386-NEXT:    kmovw %eax, %k1
; I386-NEXT:    vptestmq %xmm0, %xmm1, %k0 {%k1}
; I386-NEXT:    kmovw %k0, %eax
; I386-NEXT:    # kill: def $al killed $al killed $eax
; I386-NEXT:    retl
entry:
  %and.i.i = and <2 x i64> %__B, %__A
  %0 = icmp ne <2 x i64> %and.i.i, zeroinitializer
  %1 = bitcast i8 %__U to <8 x i1>
  %2 = shufflevector <8 x i1> %1, <8 x i1> undef, <2 x i32> <i32 0, i32 1>
  %3 = and <2 x i1> %0, %2
  %4 = shufflevector <2 x i1> %3, <2 x i1> zeroinitializer, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 2, i32 3, i32 2, i32 3>
  %5 = bitcast <8 x i1> %4 to i8
  ret i8 %5
}

; Function Attrs: norecurse nounwind readnone
define zeroext i8 @TEST_mm_mask_test_epi32_mask(i8 %__U, <2 x i64> %__A, <2 x i64> %__B) local_unnamed_addr #0 {
; X86_64-LABEL: TEST_mm_mask_test_epi32_mask:
; X86_64:       # %bb.0: # %entry
; X86_64-NEXT:    kmovw %edi, %k1
; X86_64-NEXT:    vptestmd %xmm0, %xmm1, %k0 {%k1}
; X86_64-NEXT:    kmovw %k0, %eax
; X86_64-NEXT:    # kill: def $al killed $al killed $eax
; X86_64-NEXT:    retq
;
; I386-LABEL: TEST_mm_mask_test_epi32_mask:
; I386:       # %bb.0: # %entry
; I386-NEXT:    movzbl {{[0-9]+}}(%esp), %eax
; I386-NEXT:    kmovw %eax, %k1
; I386-NEXT:    vptestmd %xmm0, %xmm1, %k0 {%k1}
; I386-NEXT:    kmovw %k0, %eax
; I386-NEXT:    # kill: def $al killed $al killed $eax
; I386-NEXT:    retl
entry:
  %and.i.i = and <2 x i64> %__B, %__A
  %0 = bitcast <2 x i64> %and.i.i to <4 x i32>
  %1 = icmp ne <4 x i32> %0, zeroinitializer
  %2 = bitcast i8 %__U to <8 x i1>
  %3 = shufflevector <8 x i1> %2, <8 x i1> undef, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %4 = and <4 x i1> %1, %3
  %5 = shufflevector <4 x i1> %4, <4 x i1> zeroinitializer, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %6 = bitcast <8 x i1> %5 to i8
  ret i8 %6
}


; Function Attrs: norecurse nounwind readnone
define zeroext i8 @TEST_mm256_mask_test_epi64_mask(i8 %__U, <4 x i64> %__A, <4 x i64> %__B) local_unnamed_addr #0 {
; X86_64-LABEL: TEST_mm256_mask_test_epi64_mask:
; X86_64:       # %bb.0: # %entry
; X86_64-NEXT:    kmovw %edi, %k1
; X86_64-NEXT:    vptestmq %ymm0, %ymm1, %k0 {%k1}
; X86_64-NEXT:    kmovw %k0, %eax
; X86_64-NEXT:    # kill: def $al killed $al killed $eax
; X86_64-NEXT:    vzeroupper
; X86_64-NEXT:    retq
;
; I386-LABEL: TEST_mm256_mask_test_epi64_mask:
; I386:       # %bb.0: # %entry
; I386-NEXT:    movzbl {{[0-9]+}}(%esp), %eax
; I386-NEXT:    kmovw %eax, %k1
; I386-NEXT:    vptestmq %ymm0, %ymm1, %k0 {%k1}
; I386-NEXT:    kmovw %k0, %eax
; I386-NEXT:    # kill: def $al killed $al killed $eax
; I386-NEXT:    vzeroupper
; I386-NEXT:    retl
entry:
  %and.i.i = and <4 x i64> %__B, %__A
  %0 = icmp ne <4 x i64> %and.i.i, zeroinitializer
  %1 = bitcast i8 %__U to <8 x i1>
  %2 = shufflevector <8 x i1> %1, <8 x i1> undef, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %3 = and <4 x i1> %0, %2
  %4 = shufflevector <4 x i1> %3, <4 x i1> zeroinitializer, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %5 = bitcast <8 x i1> %4 to i8
  ret i8 %5
}

; Function Attrs: norecurse nounwind readnone
define zeroext i8 @TEST_mm256_mask_test_epi32_mask(i8 %__U, <4 x i64> %__A, <4 x i64> %__B) local_unnamed_addr #0 {
; X86_64-LABEL: TEST_mm256_mask_test_epi32_mask:
; X86_64:       # %bb.0: # %entry
; X86_64-NEXT:    kmovw %edi, %k1
; X86_64-NEXT:    vptestmd %ymm0, %ymm1, %k0 {%k1}
; X86_64-NEXT:    kmovw %k0, %eax
; X86_64-NEXT:    # kill: def $al killed $al killed $eax
; X86_64-NEXT:    vzeroupper
; X86_64-NEXT:    retq
;
; I386-LABEL: TEST_mm256_mask_test_epi32_mask:
; I386:       # %bb.0: # %entry
; I386-NEXT:    movzbl {{[0-9]+}}(%esp), %eax
; I386-NEXT:    kmovw %eax, %k1
; I386-NEXT:    vptestmd %ymm0, %ymm1, %k0 {%k1}
; I386-NEXT:    kmovw %k0, %eax
; I386-NEXT:    # kill: def $al killed $al killed $eax
; I386-NEXT:    vzeroupper
; I386-NEXT:    retl
entry:
  %and.i.i = and <4 x i64> %__B, %__A
  %0 = bitcast <4 x i64> %and.i.i to <8 x i32>
  %1 = icmp ne <8 x i32> %0, zeroinitializer
  %2 = bitcast i8 %__U to <8 x i1>
  %3 = and <8 x i1> %1, %2
  %4 = bitcast <8 x i1> %3 to i8
  ret i8 %4
}

; Function Attrs: norecurse nounwind readnone
define zeroext i8 @TEST_mm_testn_epi64_mask(<2 x i64> %__A, <2 x i64> %__B) local_unnamed_addr #0 {
; X86_64-LABEL: TEST_mm_testn_epi64_mask:
; X86_64:       # %bb.0: # %entry
; X86_64-NEXT:    vptestnmq %xmm0, %xmm1, %k0
; X86_64-NEXT:    kmovw %k0, %eax
; X86_64-NEXT:    # kill: def $al killed $al killed $eax
; X86_64-NEXT:    retq
;
; I386-LABEL: TEST_mm_testn_epi64_mask:
; I386:       # %bb.0: # %entry
; I386-NEXT:    vptestnmq %xmm0, %xmm1, %k0
; I386-NEXT:    kmovw %k0, %eax
; I386-NEXT:    # kill: def $al killed $al killed $eax
; I386-NEXT:    retl
entry:
  %and.i.i = and <2 x i64> %__B, %__A
  %0 = icmp eq <2 x i64> %and.i.i, zeroinitializer
  %1 = shufflevector <2 x i1> %0, <2 x i1> zeroinitializer, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 2, i32 3, i32 2, i32 3>
  %2 = bitcast <8 x i1> %1 to i8
  ret i8 %2
}

; Function Attrs: norecurse nounwind readnone
define zeroext i8 @TEST_mm_testn_epi32_mask(<2 x i64> %__A, <2 x i64> %__B) local_unnamed_addr #0 {
; X86_64-LABEL: TEST_mm_testn_epi32_mask:
; X86_64:       # %bb.0: # %entry
; X86_64-NEXT:    vptestnmd %xmm0, %xmm1, %k0
; X86_64-NEXT:    kmovw %k0, %eax
; X86_64-NEXT:    # kill: def $al killed $al killed $eax
; X86_64-NEXT:    retq
;
; I386-LABEL: TEST_mm_testn_epi32_mask:
; I386:       # %bb.0: # %entry
; I386-NEXT:    vptestnmd %xmm0, %xmm1, %k0
; I386-NEXT:    kmovw %k0, %eax
; I386-NEXT:    # kill: def $al killed $al killed $eax
; I386-NEXT:    retl
entry:
  %and.i.i = and <2 x i64> %__B, %__A
  %0 = bitcast <2 x i64> %and.i.i to <4 x i32>
  %1 = icmp eq <4 x i32> %0, zeroinitializer
  %2 = shufflevector <4 x i1> %1, <4 x i1> zeroinitializer, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %3 = bitcast <8 x i1> %2 to i8
  ret i8 %3
}

; Function Attrs: norecurse nounwind readnone
define zeroext i8 @TEST_mm256_testn_epi64_mask(<4 x i64> %__A, <4 x i64> %__B) local_unnamed_addr #0 {
; X86_64-LABEL: TEST_mm256_testn_epi64_mask:
; X86_64:       # %bb.0: # %entry
; X86_64-NEXT:    vptestnmq %ymm0, %ymm1, %k0
; X86_64-NEXT:    kmovw %k0, %eax
; X86_64-NEXT:    # kill: def $al killed $al killed $eax
; X86_64-NEXT:    vzeroupper
; X86_64-NEXT:    retq
;
; I386-LABEL: TEST_mm256_testn_epi64_mask:
; I386:       # %bb.0: # %entry
; I386-NEXT:    vptestnmq %ymm0, %ymm1, %k0
; I386-NEXT:    kmovw %k0, %eax
; I386-NEXT:    # kill: def $al killed $al killed $eax
; I386-NEXT:    vzeroupper
; I386-NEXT:    retl
entry:
  %and.i.i = and <4 x i64> %__B, %__A
  %0 = icmp eq <4 x i64> %and.i.i, zeroinitializer
  %1 = shufflevector <4 x i1> %0, <4 x i1> zeroinitializer, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %2 = bitcast <8 x i1> %1 to i8
  ret i8 %2
}

; Function Attrs: norecurse nounwind readnone
define zeroext i8 @TEST_mm256_testn_epi32_mask(<4 x i64> %__A, <4 x i64> %__B) local_unnamed_addr #0 {
; X86_64-LABEL: TEST_mm256_testn_epi32_mask:
; X86_64:       # %bb.0: # %entry
; X86_64-NEXT:    vptestnmd %ymm0, %ymm1, %k0
; X86_64-NEXT:    kmovw %k0, %eax
; X86_64-NEXT:    # kill: def $al killed $al killed $eax
; X86_64-NEXT:    vzeroupper
; X86_64-NEXT:    retq
;
; I386-LABEL: TEST_mm256_testn_epi32_mask:
; I386:       # %bb.0: # %entry
; I386-NEXT:    vptestnmd %ymm0, %ymm1, %k0
; I386-NEXT:    kmovw %k0, %eax
; I386-NEXT:    # kill: def $al killed $al killed $eax
; I386-NEXT:    vzeroupper
; I386-NEXT:    retl
entry:
  %and.i.i = and <4 x i64> %__B, %__A
  %0 = bitcast <4 x i64> %and.i.i to <8 x i32>
  %1 = icmp eq <8 x i32> %0, zeroinitializer
  %2 = bitcast <8 x i1> %1 to i8
  ret i8 %2
}

; Function Attrs: norecurse nounwind readnone
define zeroext i8 @TEST_mm_mask_testn_epi64_mask(i8 %__U, <2 x i64> %__A, <2 x i64> %__B) local_unnamed_addr #0 {
; X86_64-LABEL: TEST_mm_mask_testn_epi64_mask:
; X86_64:       # %bb.0: # %entry
; X86_64-NEXT:    kmovw %edi, %k1
; X86_64-NEXT:    vptestnmq %xmm0, %xmm1, %k0 {%k1}
; X86_64-NEXT:    kmovw %k0, %eax
; X86_64-NEXT:    # kill: def $al killed $al killed $eax
; X86_64-NEXT:    retq
;
; I386-LABEL: TEST_mm_mask_testn_epi64_mask:
; I386:       # %bb.0: # %entry
; I386-NEXT:    movzbl {{[0-9]+}}(%esp), %eax
; I386-NEXT:    kmovw %eax, %k1
; I386-NEXT:    vptestnmq %xmm0, %xmm1, %k0 {%k1}
; I386-NEXT:    kmovw %k0, %eax
; I386-NEXT:    # kill: def $al killed $al killed $eax
; I386-NEXT:    retl
entry:
  %and.i.i = and <2 x i64> %__B, %__A
  %0 = icmp eq <2 x i64> %and.i.i, zeroinitializer
  %1 = bitcast i8 %__U to <8 x i1>
  %2 = shufflevector <8 x i1> %1, <8 x i1> undef, <2 x i32> <i32 0, i32 1>
  %3 = and <2 x i1> %0, %2
  %4 = shufflevector <2 x i1> %3, <2 x i1> zeroinitializer, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 2, i32 3, i32 2, i32 3>
  %5 = bitcast <8 x i1> %4 to i8
  ret i8 %5
}

; Function Attrs: norecurse nounwind readnone
define zeroext i8 @TEST_mm_mask_testn_epi32_mask(i8 %__U, <2 x i64> %__A, <2 x i64> %__B) local_unnamed_addr #0 {
; X86_64-LABEL: TEST_mm_mask_testn_epi32_mask:
; X86_64:       # %bb.0: # %entry
; X86_64-NEXT:    kmovw %edi, %k1
; X86_64-NEXT:    vptestnmd %xmm0, %xmm1, %k0 {%k1}
; X86_64-NEXT:    kmovw %k0, %eax
; X86_64-NEXT:    # kill: def $al killed $al killed $eax
; X86_64-NEXT:    retq
;
; I386-LABEL: TEST_mm_mask_testn_epi32_mask:
; I386:       # %bb.0: # %entry
; I386-NEXT:    movzbl {{[0-9]+}}(%esp), %eax
; I386-NEXT:    kmovw %eax, %k1
; I386-NEXT:    vptestnmd %xmm0, %xmm1, %k0 {%k1}
; I386-NEXT:    kmovw %k0, %eax
; I386-NEXT:    # kill: def $al killed $al killed $eax
; I386-NEXT:    retl
entry:
  %and.i.i = and <2 x i64> %__B, %__A
  %0 = bitcast <2 x i64> %and.i.i to <4 x i32>
  %1 = icmp eq <4 x i32> %0, zeroinitializer
  %2 = bitcast i8 %__U to <8 x i1>
  %3 = shufflevector <8 x i1> %2, <8 x i1> undef, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %4 = and <4 x i1> %1, %3
  %5 = shufflevector <4 x i1> %4, <4 x i1> zeroinitializer, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %6 = bitcast <8 x i1> %5 to i8
  ret i8 %6
}


; Function Attrs: norecurse nounwind readnone
define zeroext i8 @TEST_mm256_mask_testn_epi64_mask(i8 %__U, <4 x i64> %__A, <4 x i64> %__B) local_unnamed_addr #0 {
; X86_64-LABEL: TEST_mm256_mask_testn_epi64_mask:
; X86_64:       # %bb.0: # %entry
; X86_64-NEXT:    kmovw %edi, %k1
; X86_64-NEXT:    vptestnmq %ymm0, %ymm1, %k0 {%k1}
; X86_64-NEXT:    kmovw %k0, %eax
; X86_64-NEXT:    # kill: def $al killed $al killed $eax
; X86_64-NEXT:    vzeroupper
; X86_64-NEXT:    retq
;
; I386-LABEL: TEST_mm256_mask_testn_epi64_mask:
; I386:       # %bb.0: # %entry
; I386-NEXT:    movzbl {{[0-9]+}}(%esp), %eax
; I386-NEXT:    kmovw %eax, %k1
; I386-NEXT:    vptestnmq %ymm0, %ymm1, %k0 {%k1}
; I386-NEXT:    kmovw %k0, %eax
; I386-NEXT:    # kill: def $al killed $al killed $eax
; I386-NEXT:    vzeroupper
; I386-NEXT:    retl
entry:
  %and.i.i = and <4 x i64> %__B, %__A
  %0 = icmp eq <4 x i64> %and.i.i, zeroinitializer
  %1 = bitcast i8 %__U to <8 x i1>
  %2 = shufflevector <8 x i1> %1, <8 x i1> undef, <4 x i32> <i32 0, i32 1, i32 2, i32 3>
  %3 = and <4 x i1> %0, %2
  %4 = shufflevector <4 x i1> %3, <4 x i1> zeroinitializer, <8 x i32> <i32 0, i32 1, i32 2, i32 3, i32 4, i32 5, i32 6, i32 7>
  %5 = bitcast <8 x i1> %4 to i8
  ret i8 %5
}

; Function Attrs: norecurse nounwind readnone
define zeroext i8 @TEST_mm256_mask_testn_epi32_mask(i8 %__U, <4 x i64> %__A, <4 x i64> %__B) local_unnamed_addr #0 {
; X86_64-LABEL: TEST_mm256_mask_testn_epi32_mask:
; X86_64:       # %bb.0: # %entry
; X86_64-NEXT:    kmovw %edi, %k1
; X86_64-NEXT:    vptestnmd %ymm0, %ymm1, %k0 {%k1}
; X86_64-NEXT:    kmovw %k0, %eax
; X86_64-NEXT:    # kill: def $al killed $al killed $eax
; X86_64-NEXT:    vzeroupper
; X86_64-NEXT:    retq
;
; I386-LABEL: TEST_mm256_mask_testn_epi32_mask:
; I386:       # %bb.0: # %entry
; I386-NEXT:    movzbl {{[0-9]+}}(%esp), %eax
; I386-NEXT:    kmovw %eax, %k1
; I386-NEXT:    vptestnmd %ymm0, %ymm1, %k0 {%k1}
; I386-NEXT:    kmovw %k0, %eax
; I386-NEXT:    # kill: def $al killed $al killed $eax
; I386-NEXT:    vzeroupper
; I386-NEXT:    retl
entry:
  %and.i.i = and <4 x i64> %__B, %__A
  %0 = bitcast <4 x i64> %and.i.i to <8 x i32>
  %1 = icmp eq <8 x i32> %0, zeroinitializer
  %2 = bitcast i8 %__U to <8 x i1>
  %3 = and <8 x i1> %1, %2
  %4 = bitcast <8 x i1> %3 to i8
  ret i8 %4
}

